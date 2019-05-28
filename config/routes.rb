Rails.application.routes.draw do

  get 'sessions/new'
  get 'welcome/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/edit', to: 'posts#edit'
  # patch '/posts/:id', to: 'posts#update'

  resources :users
  resources :posts

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
