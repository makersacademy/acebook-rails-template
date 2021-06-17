Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # get 'users_new', to: 'users#new'
   resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  root to: "posts#index"

  get '/new', to: 'posts#new'

end
