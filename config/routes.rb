Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  post '/post/create' => 'posts#create'
  post '/posts_create' => 'posts#create'
  post '/log_out' => 'sessions#destroy'
  post '/log_in' => 'sessions#new'
  get '/new' => 'users#new'
  post '/like_post' => 'posts#like', as: "like_post"
  resources :sessions
  post "/comment_on_posts" => 'posts#comment', as: "comment_on_posts"
end
