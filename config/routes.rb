# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users do
  #   resources :posts
  # end

  devise_for :users, :controller => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users do
  #   resources :posts, only: [:new, :edit, :update, :destroy, :create, :show]
  # end
  
  # resources :posts, only: [:index]

  resources :posts


  root to: 'posts#index'
end
