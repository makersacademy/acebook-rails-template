# frozen_string_literal: true

Rails.application.routes.draw do
  resources :albums

  get 'profile/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'albums/index'
  get 'posts/index'
  root 'posts#index'
  root 'albums#index'

  resources :posts do
    resources :users
  end
  resources :profile

  root 'posts#index'
end
