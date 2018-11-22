# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  get 'users/registration_confirmation'
  get 'users/show'

  root to: 'application#redirect_to_login'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    member do
  		post 'like'
  	end
    resources :comments do
      member do
    		post 'like'
    	end
    end
  end
end
