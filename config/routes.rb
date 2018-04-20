# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => '/cable'

  get 'welcome/index'

  # Resources should never be nested more than 1 level deep!

  resources :posts do
    resources :likes, only: %i[create update]
    resources :comments
  end

  resources :comments do
    resources :likes, only: %i[create update]
  end

  resources :conversations, only: %i[index show]
  resources :users
  resources :online, only: [:index]
  resources :personal_messages, only: %i[new create]
  
  root 'welcome#index'
end
