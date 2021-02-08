Rails.application.routes.draw do
  get "/", to: "users#index"

  get 'users/login'
  post '/users/authenticate'
  post "/users/log_out"

  get "/timeline", to: "posts#index"

  resources :users
  
  resources :posts do
    resources :comments
  end
end
