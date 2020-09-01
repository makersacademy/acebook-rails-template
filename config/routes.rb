Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/home', to: 'users#show' #test

  get '/create_session', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :posts, :users


  root 'users#new'
end
