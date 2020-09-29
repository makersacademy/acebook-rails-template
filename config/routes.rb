Rails.application.routes.draw do
  resources :comments
  root 'posts#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    resources :likes
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  
  get 'profile', to: 'users#show', as: 'profile'
end
