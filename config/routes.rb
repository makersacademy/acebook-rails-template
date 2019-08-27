# frozen_string_literal: true
  
Rails.application.routes.draw do

    namespace :api do
      namespace :v1 do
        resources :posts
      end
    end
    get 'sessions/new'

    # get 'users/new'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
    root 'users#new'
    get '/update' => 'posts#update'
    get '/post_api' => 'posts#post_api'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/help', to: 'static_pages#help'
    # get  '/about',   to: 'static_pages#about'
    # get  '/contact', to: 'static_pages#contact'
    # get  '/signup',  to: 'users#new'
    # post '/signup',  to: 'users#create'
    resources :posts
    resources :users
    resources :sessions
end
