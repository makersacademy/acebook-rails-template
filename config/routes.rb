Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/user/:id', to: 'users#wall', as: :user_page
  root to: 'users#wall'
  resources :posts
end
