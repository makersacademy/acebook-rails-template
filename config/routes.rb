Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, only: [:new,:create]
  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  get '/', to: 'sessions#welcome'
  get 'logout', to: 'sessions#destroy'

  
  get '/user/create', to: 'user#new'
  post '/user/create', to: 'user#create'
  get '/user/:id', to: 'user#show', as: 'user_page'
  

  delete '/posts/:id(.:format)', to: 'posts#destroy'
  resources :posts
  
end
