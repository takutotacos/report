class ReportsController < ApplicationController

  def form
    @today = Date.today.strftime("%Y/%m/%d")
    user_id = session[:user_id]

    # ログインユーザが日報を既に登録しているか確認
    if Report.where('user_id = ? AND create_date = ?', user_id, @today).exists?
      redirect_to '/reports/show', notice: '既に日報を提出しています。'
    else
      @groups = Group.joins(:users).where('users.user_id = ?', user_id)
      @user = User.where('user_id = ?', user_id).first
      
      if Report.where('user_id = ?', user_id).exists?
        @report = Report.where('user_id = ?', user_id).order(create_date: :desc).first
        @planneds = Planned.where('report_id = ?', @report[:id])
        @is_first_time = false
      else
        @report = Report.new
        @report.actuals.build
        @report.planneds.build
        @is_first_time = true
      end
    end
  end

  def add
    actual = Actual.new
    num = 0
    actuals = params[:report][:actuals_attributes]
    # 工数を算出する。実績タスクの数だけループを回す。
    actuals.each do |a|
      time_spent = actual.set_time_spent(actuals[num.to_s][:array_start_time], actuals[num.to_s][:array_end_time])
      actuals[num.to_s][:actual_task_time_spent] = time_spent
      num.to_i
      num += 1
    end
    @report = Report.create(report_columns)
    redirect_to '/reports/show'
  end


  def report_columns
    params.require(:report).permit(:create_date, :comment, :user_id, :group_id, actuals_attributes: [:actual_task_project, :actual_task, :task_no, :user_id, :create_date, :actual_task_time_spent], planneds_attributes: [:planned_task_project, :planned_task, :task_no, :user_id, :create_date])
  end
end
