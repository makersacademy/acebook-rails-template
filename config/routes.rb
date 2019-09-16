Rails.application.routes.draw do
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  post 'posts/update' => 'posts#update'
  get '/posts/:id' => 'posts#show'
  post 'posts' => 'posts#create'

  resources :user, only: [:show] do
    resources :posts, only: [:new, :create, :index, :update, :show]
  end

  devise_for :users
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
