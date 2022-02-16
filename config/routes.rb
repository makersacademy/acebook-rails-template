Rails.application.routes.draw do
  get 'profile/show'
  devise_for :users

  resources :posts
  resources :profile
  resources :users, only: [:create, :new, :show, :edit, :update]
  root to: 'posts#index'
  
end


