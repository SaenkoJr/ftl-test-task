# frozen_string_literal: true

class Web::UsersController < Web::ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: t('.success')
    else
      redirect_to new_user_path, alert: t('.failed')
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirm)
  end
end
