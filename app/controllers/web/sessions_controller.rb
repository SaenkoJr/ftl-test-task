# frozen_string_literal: true

class Web::SessionsController < Web::ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: sign_in_params[:username])

    if user&.authenticate(sign_in_params[:password])
      sign_in user
      redirect_to root_path, notice: t('.success')
    else
      redirect_to new_session_path, notice: t('.failed')
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

  private

  def sign_in_params
    params.require(:user).permit(:username, :password)
  end
end
