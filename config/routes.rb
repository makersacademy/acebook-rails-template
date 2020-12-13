Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :users
  # get "/sign-up", to: "devise/registrations#new", as: "sign_up"
  root to: "posts#index"
end
