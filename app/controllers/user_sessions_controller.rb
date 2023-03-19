class UserSessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new

    end

    def create
      @user = login(params[:email], params[:password])
      if @user
        redirect_back_or_to root_path, success: t('view_name_user_sessions.index.login')
      else
        flash.now[:danger] = t('view_name_user_sessions.index.logout_failed')
        render :new
      end
    end

    def destroy
      logout
      redirect_to login_path, warning: t('view_name_user_sessions.index.logout')
    end
end
