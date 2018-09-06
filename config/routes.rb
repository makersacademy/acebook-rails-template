# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :posts do
    resources :comments
  end

  resources :post do
    resources :likes
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/me' => 'users#me'
  post '/me' => 'users#update_avatar'
end
