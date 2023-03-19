class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to login_path
        flash[:success] = t('view_name_user.index.sign_up')
    else
        flash.now[:danger] = t('view_name_user.index.new_registration_failed')
        render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name)
  end
end
