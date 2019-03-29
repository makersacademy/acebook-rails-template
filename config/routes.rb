Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/update' , to: "posts#update"
  post 'posts/update', to: "posts#edit"
  get 'posts/delete', to: 'posts#delete'


  get '/signup', to: 'signup#index'
  post '/signup', to: 'signup#create'
  resources :signup, :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'signup#index'
end
