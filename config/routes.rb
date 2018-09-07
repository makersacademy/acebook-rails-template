# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'posts#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments
  resources :posts
  resources :posts do
    member do
      put 'like', to: 'posts#upvote'
      put 'dislike', to: 'posts#downvote'
    end
  end
end
