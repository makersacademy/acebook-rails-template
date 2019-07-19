Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'


  
  resources :users do
    resources :posts
  end
  resources :sessions, only: [:new, :create]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'posts', to: 'users#posts', as: 'posts'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'users#new'
end
