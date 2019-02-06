Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/404", :to => "errors#not_found"
  root 'users#index'
  resources :errors
  resources :users
  resources :posts
  resources :sessions
end
