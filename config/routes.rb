# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, :users
  # root 'users#new'
  get '/' => 'users#new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'users#login'
  post '/login' => 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
<<<<<<< HEAD
  get '/profile/' => 'addfriends#index'
=======
  get '/profile/' => 'friendships#index'

  post '/friend' => 'friendships#create'
>>>>>>> master
end
