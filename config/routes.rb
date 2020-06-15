Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  devise_for :users

  resources :posts

  resources :users

  get 'wall', to: 'posts#wall'

  # get 'users', to: 'views#show'

  # namespace :user do
  #   root :to => 'users#show'
  # end

  root :to => 'home#index'

  get "/404", :to => "errors#not_found"
  get "/500", :to => "errors#internal_server_error"
end
