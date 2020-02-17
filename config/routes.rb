# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'posts/index'

  root 'posts#index'

  resources :posts do
    resources :users
  end
end
