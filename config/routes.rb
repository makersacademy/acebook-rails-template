# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  #resources :likes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes
  end

  get ':id', :controller => 'users', :action => 'show', :as => 'user_page'

  root 'welcome#index'
end
