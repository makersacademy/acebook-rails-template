Rails.application.routes.draw do
  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'

  get '/show', to: 'posts#show'

  get "active",  to: "sessions#active"
  
  get "timeout", to: "sessions#timeout"
  
   resources :users
  
  resources :posts do
    member do
      patch "upvote", to: "posts#like"
    end 
    resources :comments
  end

  root to: "posts#index"

  get '/new', to: 'posts#new'

end
