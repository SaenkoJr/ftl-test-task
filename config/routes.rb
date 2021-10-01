# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    # FIXME: replace
    root 'users#new'

    resource :session, only: %i[new create destroy]
    resource :user, only: %i[new create]
  end
end
