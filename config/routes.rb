Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "session/create"
  resources :posts, :session, :users


  get '/' => 'users#new'

  # get '/posts/' => 'posts#index'


  resources :users do
    resources :posts
  end
  # posts_path(:id) returns /users/posts/:id

end
