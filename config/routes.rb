Rails.application.routes.draw do
  get 'users/create'

  get 'users/sign_up'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  root 'home#index'
end
