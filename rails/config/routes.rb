# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'health_check', to: 'health_check#index'
      mount_devise_token_auth_for 'User', at: 'auth'
      mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

      namespace :current do
        resource :user, only: [:show]
      end
      resources :articles, only: [:show]
    end
  end
end
