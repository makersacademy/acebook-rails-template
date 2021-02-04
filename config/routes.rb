Rails.application.routes.draw do
  root "articles#index"

  get "/anythingrandom", to: "articles#index"

  get 'users/login'

    post '/users/authenticate'
  resources :posts, :users
end
