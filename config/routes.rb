Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # resources :sessions, only: [:new, :create, :destroy]
  # get ‘signup’, to: "users#new", as: ‘signup’
  # get ‘login’, to: "sessions#new", as: ‘login’
  # get ‘logout’, to: "sessions#destroy", as: ‘logout’

  resources :users
  # get 'welcome/index'
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
