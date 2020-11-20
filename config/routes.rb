Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  post '/post/create' => 'posts#create'
  post '/posts_create' => 'posts#create'
  post '/log_out' => 'sessions#destroy'
  get '/new' => 'users#new'
  post '/like_post' => 'posts#like'
  resources :sessions
  
end
