Rails.application.routes.draw do
  get 'sessions/index'

  resources :sessions, only: [:new, :create, :destroy]

  # # get '/login', to: "sessions#new"
  # post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  root 'sessions#new'

  get '/update', to: "posts#update"
  post '/update', to: "posts#update"
  put '/update', to: "posts#update"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions

  resources :users

  resources :posts
  get '/:id', to: "posts#show"

  resources :id, module:'posts'

end
