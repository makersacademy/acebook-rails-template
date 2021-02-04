Rails.application.routes.draw do


  resources :friendships
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'posts#index'
  get '/posts', to: 'posts#index'
end
