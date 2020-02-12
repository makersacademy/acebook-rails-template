Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "welcome#index"
  post '/sessions' => 'sessions#create'
  # post '/user' => 'user#new'
  get '/posts' => 'posts#index'

  resources :posts
  resources :user
end
