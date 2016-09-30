class UsersController < ApplicationController
    # 新規アカウント登録用のフォーム生成
    def new
        @user = User.new
        @groups = Group.all
      end

    # 登録するとログイン画面に遷移。
    def create
        @user = User.new(user_params)
         groups = Group.where(group_id: [params[:group][:group_ids]])
        @user.groups<<groups

        if @user.save
          log_in @user
          remember user
          flash[:success] = "Welcome to the report management system!"
          redirect_to @user
        else
          flash.now[:notice] = '登録に失敗しました。'
          @groups = Group.all
          render 'new'
            # redirect_to '/user', notice: '登録できませんでした。'
        end
   end

    private

      def user_params
          params.require(:user).permit(:user_id, :user_name, :password, :password_confirmation)
      end
end
