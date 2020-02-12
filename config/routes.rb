Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user, only: [:new,:create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/', to: 'sessions#welcome'
  
  get '/user/create', to: 'user#new'
  post '/user/create', to: 'user#create'

  # get 'welcome/index'
  # root "session#welcome"
  resources :posts
end
