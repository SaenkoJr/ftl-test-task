# frozen_string_literal: true

class Web::UsersController < Web::ApplicationController
  def new
    @user = User.new
  end

  def show
    @spendings = User.find_by(username: params[:username])
                     .spendings
                     .includes(:category)
    @total_amount = @spendings.sum(:amount)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
