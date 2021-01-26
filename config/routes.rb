Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  root 'welcome#index'

  get "/users/new", to: "welcome#signup"
  get "welcome/signup", to: "welcome#signup"

end
