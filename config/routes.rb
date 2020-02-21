# frozen_string_literal: true

Rails.application.routes.draw do
  get 'messages/create'

  post 'messages' => 'messages#create'

  get 'chat' => 'rooms#show'

  get '/home' => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  resources :users do
    resources :posts
  end

  resources :friendships

  resources :sessions

  resources :posts do
    resources :comments
    resources :likes
  end

  resources :comments do
    resources :commentlikes
  end

  resources :sessions, only: %i[new create]

  delete '/logout' => 'sessions#destroy'
  resources :posts, only: :index
  root 'welcome#index'

  get '/auth/:provider/callback' => 'sessions#create_oauth'
end
