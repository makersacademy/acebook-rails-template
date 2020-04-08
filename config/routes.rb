Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  post "/addpost", to: "posts#create"
    # User Routes
  get '/users', to: "users#index"
  get '/sign-up', to: 'users#new_user'
  post '/users', to: 'users#create_a_user'
  post '/authentication', to: 'users#auth'
  post '/log-out', to: 'users#logout'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users', to: 'users#update_user'
  resources :posts do
    resources :comment
  end

end
