Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  post "/test", to: "posts#create"

  
  resources :posts
end
