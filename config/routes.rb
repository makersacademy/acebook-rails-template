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

  resources :posts

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
