# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do 
    resources :comments 
  end

  resources :posts do
    resources :likes
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'users#new'
  match '/signup',  to: 'users#new', via: [:get, :post]
  match '/signin',  to: 'sessions#new', via: [:get, :post]
  match '/signout', to: 'sessions#destroy', via: [:delete]
  match 'users/:id' => 'users#show', via: :get

end
