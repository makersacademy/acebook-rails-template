Rails.application.routes.draw do
  get 'posts/index', to: 'posts#index'

  get '/signup', to: 'signup#index'
  post '/signup', to: 'signup#create'
  resources :signup, :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
end
