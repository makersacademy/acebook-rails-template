Rails.application.routes.draw do
  root "posts#index"

  get "/posts", to: "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "posts", to: "posts#create"

  get "/posts/new", to: "posts#new"
end
