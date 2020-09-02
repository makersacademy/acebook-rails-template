Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/home', to: 'users#show' #test

  get '/create_session', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  delete '/posts/:id/comments', to: 'comments#destroy'
  post '/posts/:post_id/comments/:id', to: 'comments#update'
  get '/posts/:post_id/comments/:id', to: 'comments#show'
  resources :users

  resources :posts do
    resources :comments
  end

  get 'auth/:provider/callback' => "sessions#create"
  root 'users#new'
end
