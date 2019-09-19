Rails.application.routes.draw do
  get '/user/:id' => 'user#index'
  get '/user/:id' => 'user#show'
  get '/posts' => 'posts#index'
  delete '/posts' => 'posts#delete'
  get '/posts/new' => 'posts#new'
  get '/posts/:id' => 'posts#edit'
  get '/user/posts/:id' => 'posts#edit'
  post '/user/:user_id/posts/:id/edit' => 'posts#update'
  post 'posts' => 'posts#create'

  resources :user, only: [:show] do
    resources :posts, only: [:new, :create, :index, :update, :edit]
  end
  resources :friendships
  devise_for :users 
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
