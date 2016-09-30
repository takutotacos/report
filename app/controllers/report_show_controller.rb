class ReportShowController < ApplicationController
    def show
        # ログインユーザが所属するグループあての日報をすべて表示する。
        # １．セッションからログインユーザを取得
        user = User.find(session[:user_id])
        # ２．ユーザの所属するグループとグループIDを取得
        group_ids = Group.joins(:users).where('users.user_id = ?', user.user_id).select('groups.group_id')
        @groups = Group.joins(:users).where('users.user_id = ?',  user.user_id)
        # ３．取得したグループIDを元に、レポート・次回予定・実績を取得
        @report = Report.where(group_id: group_ids).order(:created_at).reverse_order
        # ４．日付のフォーマット、本日の予定を取得
        @report.each do |y|
            require 'date'
            y.formatted_date = Date.parse(y.create_date, '%Y/%m/%d')
            y.formatted_date = y.formatted_date.to_s

            last_report = Report.where('user_id = ?', y.user_id).where('create_date < ?', y.create_date).order(create_date: :desc).first
            y.yesterday_plan = if last_report.nil?
                                   {}
                               else
                                   last_report.planneds
                               end
        end
    end

    def find
      # １．セッションからログインユーザを取得
      user = User.find(session[:user_id])
      # ログインユーザの所属グループ情報を取得
      @groups = Group.joins(:users).where('users.user_id = ?', user.user_id)

        #  検索条件に入力されたユーザ名の日報を表示する
        # 入力されたユーザ名を元に、ユーザ情報を取得。選択されたグループIDを取得。
        search_target_user = User.where('user_name = ?', params[:user_name]).first
        user_name = params[:user_name]
        group_id = params[:group][:group_id]

        # ユーザの入力条件に応じて検索条件を変更する。
        # ユーザ名、グループ名両方指定した場合
        if !group_id.empty? && !user_name.empty?
          @report = Report.where('user_id = ?', search_target_user.user_id).where('group_id = ?', group_id ).order(:created_at).reverse_order
        # ユーザ名のみを指定した場合
        elsif !user_name.empty?
          @report = Report.where('user_id = ?', search_target_user.user_id).order(:created_at).reverse_order
        # グループ名のみを指定した場合
        elsif !group_id.empty?
          @report = Report.where('group_id = ?', group_id).reverse_order
        end

        # ユーザが何も入力をしなかった、もしくはユーザからの入力に合致する検索結果がなかった場合
        if (group_id.empty? && user_name.blank?) || @report.empty?
          flash.now[:notice] = '条件に合致する日報が存在しません。'
          render 'find'
        else
        # 「本日の予定」取得および、日付のフォーマットを行う
          @report.each do |y|
              require 'date'
              y.formatted_date = Date.parse(y.create_date, '%Y/%m/%d')
              y.formatted_date = y.formatted_date.to_s
              last_report = Report.where('user_id = ?', y.user_id).where('create_date < ?', y.create_date).order(create_date: :desc).first
              y.yesterday_plan = if last_report.nil?
                                     {}
                                 else
                                     last_report.planneds
                                 end
          end
        end
    end
end
