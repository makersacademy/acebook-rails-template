Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  get "/sign-up", to: "users#new", as: "sign_up"
end
