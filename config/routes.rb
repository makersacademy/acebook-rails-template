Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # get 'users/index'
  # get 'users/new'

   root 'posts#index'


 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :posts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # get 'signup', to: 'users#new', as: 'signup'
  # post 'users', to: 'sessions#new', as: 'signup'
  # get 'login', to: 'sessions#new', as: 'login'
  # get 'logout', to: 'sessions#destroy', as: 'logout'
end
