Rails.application.routes.draw do
  root 'users#new'
  get '/sessions/new', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  post '/users', to: 'users#create'
  #resources :sessions, only: [:new, :destroy]
  resources :posts
end
