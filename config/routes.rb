Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  get '/users' => "users#index", as: :user_root
  get '/error', to: 'errors#404'
  # post '/friendships' => 'friendships#create', as: :friendships_path


  resources :users
  resources :posts
  resources :friendships
end
