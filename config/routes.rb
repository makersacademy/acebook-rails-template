Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get 'signup', to: 'users#new', as: 'signup'

  get 'login', to: 'sessions#new', as: 'login'

  post "sessions/authenticate", to: "sessions#authenticate"

  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only: [:new, :create]

  resources :courses do
    resources :posts
    resources :subscriptions, only: [:create, :destroy]
    resources :ratings, only: [:create, :update, :destroy]
  end

end
