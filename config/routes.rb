Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/authenticate' => 'authentication#authenticate'

  resources :posts
  post '/post/create' => 'posts#create'
  post '/posts_create' => 'posts#create'
  post '/log_out' => 'sessions#destroy'
  post '/log_in' => 'sessions#new'
  post '/like_post' => 'posts#like', as: "like_post"
  post "/comment_on_posts" => 'posts#comment', as: "comment_on_posts"

  get '/post_comments_and_likes' => 'posts#show'
  get '/logged_in' => 'sessions#logged_in'
  get '/new' => 'users#new'

  resources :sessions
end
