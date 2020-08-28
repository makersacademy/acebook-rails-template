Rails.application.routes.draw do
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'welcome/index'
  # get '/posts/new', to: 'posts#new'
  # post '/posts/create', to: 'posts#create'
  # get '/posts/index', to: 'posts#index'
  # get '/users/:user_id/', to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts
  end

  root 'welcome#index'
end
