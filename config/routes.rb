Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts

  authenticated :user do
    root to: "posts#index"
  end

  root to: redirect("/users/sign_in")
end
