class LoginController < ApplicationController

  def check
    # ユーザ入力に合致するユーザが存在する場合は、日報表示画面に遷移。
    user = User.find_by(user_id: params[:user_id])
    if user && user.authenticate(params[:password])
      session[:user_id] = params[:user_id]
      redirect_to '/reports/show'
      # セッションにログインユーザ情報を登録する。
    else
      redirect_to '/login' , notice: '登録情報に合致するユーザは存在しません。'
    end
  end
end
