Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users, :only => [:show, :update]
  resources :posts
end
