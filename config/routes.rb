Rails.application.routes.draw do
  root to: "users#home"
  devise_for :users
  resources :posts

end
