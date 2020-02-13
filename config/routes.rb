# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :posts
  end

  resources :sessions
  resources :posts
  resources :sessions, only: %i[new create]
  delete '/logout' => 'sessions#destroy'
  resources :posts, only: :index
  root 'welcome#index'
end
