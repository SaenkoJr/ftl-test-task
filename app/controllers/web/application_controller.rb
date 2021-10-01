# frozen_string_literal: true

class Web::ApplicationController < ApplicationController
  RANSACK_DEFATUL_SORT = 'created_at DESC'

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to new_session_path
  end

  def ransack_params
    params.fetch(:q, { s: RANSACK_DEFATUL_SORT })
  end
end
