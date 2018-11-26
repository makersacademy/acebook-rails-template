Rails.application.routes.draw do
  devise_for :users, :controllers => { sign_up: 'registrations' }
  resources :posts, :comments
  root to: 'posts#index'
end
