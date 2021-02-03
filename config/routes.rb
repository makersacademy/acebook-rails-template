Rails.application.routes.draw do
  root "articles#index"

  get "/anythingrandom", to: "articles#index"

  resources :posts
end
