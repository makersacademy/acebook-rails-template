Rails.application.routes.draw do
  devise_for :users, :path => '', path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup"}

  # do we need these??
  root 'home#index'
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

end
