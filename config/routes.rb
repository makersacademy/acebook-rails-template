Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
  get '/show', to: 'posts#show'
  # get 'users_new', to: 'users#new'
   resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    member do
      patch "upvote", to: "posts#like"
    end 
    resources :comments
  end

  root to: "posts#index"

  get '/new', to: 'posts#new'

end
