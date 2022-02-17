# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome/index'
  get 'posts/index'
  get 'posts/new'

  resources :posts do 
    resources :comments
  end 
end
