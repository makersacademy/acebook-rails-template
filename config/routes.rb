Rails.application.routes.draw do
  root "posts#index"
  
  get '/signup', controller: 'users', action: 'new'
  post '/users', controller: 'users', action: 'create'

  get '/login', controller: 'sessions', action: 'new'
  post 'sessions', controller: 'sessions', action: 'create'
  get '/logout', controller: 'sessions', action: 'destroy'

  resources :posts

end
