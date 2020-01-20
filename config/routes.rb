Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  get '/users' => "users#index", as: :user_root
  get '/error', to: 'errors#404'
  resources :users
  resources :posts
end
