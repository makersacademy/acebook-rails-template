Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: "pages#home"

  get 'signup', to: 'users#new', as: 'signup'
  # get "login", to: "users#login"
  get 'login', to: 'sessions#new', as: 'login'
  # post "users/authenticate", to: "users#authenticate"
  post "sessions/authenticate", to: "sessions#authenticate"
  # get "log out", to: "users#logout"
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :posts, :users


  resources :course do
    resources :subscribe
  end
end
