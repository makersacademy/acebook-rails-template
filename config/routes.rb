Rails.application.routes.draw do
  devise_for :users

  resources :posts
  resources :users, only: [:create, :new, :show]
  root to: 'posts#index'
  
  
end


