# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do
    resources :comments
    resources :likes
  end
end
