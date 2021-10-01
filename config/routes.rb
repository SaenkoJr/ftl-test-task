# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'spendings#index'

    resource :session, only: %i[new create destroy]
    resources :users, only: %i[new show create], param: :username
    resources :spendings
  end
end
