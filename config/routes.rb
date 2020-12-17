Rails.application.routes.draw do
  root "posts#index"
  
  get '/signup', controller: 'users', action: 'new'
  post '/users', controller: 'users', action: 'create'

  get '/login', controller: 'sessions', action: 'new'
  post 'sessions', controller: 'sessions', action: 'create'
  get '/logout', controller: 'sessions', action: 'destroy'

  get "/posts", to: "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
