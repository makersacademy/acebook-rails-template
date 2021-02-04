Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/posts')
  resources :posts
end
