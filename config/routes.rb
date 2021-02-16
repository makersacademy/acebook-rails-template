Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "login", to: "users#login"
  post "users/authenticate", to: "users#authenticate"
  get "log out", to: "users#logout"

  resources :posts, :users
end
