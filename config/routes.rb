Rails.application.routes.draw do

  get 'posts/index'
  
  get 'posts/new', to: 'posts#new', as: 'new_post'
  
  get 'users/new', as: 'signup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :posts
  
  resources :users do
    resources :posts
  end

  resources :posts, only: [:index]
  
  resources :sessions, only: [:login, :login_attempt, :logout]


  get "login", to: "sessions#login", as: 'login'
  post "login", to: "sessions#login_attempt"
  get "logout", to: "sessions#logout", as: 'logout'
 
  root 'welcome#index'
end
