Rails.application.routes.draw do
  root 'users#new'

  resources :users do
    resources :posts
  end

  resources :sessions, only: [:new, :create]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
