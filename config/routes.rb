Rails.application.routes.draw do
  get 'pages/home'

  devise_for :users
  resources :posts
  root to: "pages#home"
end
