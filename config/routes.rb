# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'spendings#index'

    resource :session, only: %i[new create destroy]
    resource :user, only: %i[new create]
    resources :spendings
  end
end
