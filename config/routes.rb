Rails.application.routes.draw do
  get 'sessions/index'

  resources :sessions, only: [:new, :create, :destroy]

  # # get '/login', to: "sessions#new"
  # post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/:id', to: "users#show"
  
  root 'sessions#new'

  get '/update', to: "posts#update"
  post '/update', to: "posts#update"
  put '/update', to: "posts#update"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  # resources :id, path: '/users/id'

end
