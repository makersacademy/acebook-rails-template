Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  get '/sessions/new', to: 'sessions#new'
  post '/users', to: 'users#create'
  resources :posts
end
