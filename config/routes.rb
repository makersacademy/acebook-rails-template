# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/new'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  resources :users do
    resources :posts
  end
end
