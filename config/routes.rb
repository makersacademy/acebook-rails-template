# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get '/homepage', to: 'welcome#index'


  get '/signup', to: 'users#new'
  
  post '/signup', to: 'users#create'



  get '/posts', to: 'posts#new'

  post '/posts', to: 'posts#create'

  get '/poststo', to: 'posts#index'



  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :posts
end
