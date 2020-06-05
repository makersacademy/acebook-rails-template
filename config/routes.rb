Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/sessions/destroy'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  #resources :sessions, only: [:new, :destroy]
  resources :posts
end
