Rails.application.routes.draw do
  get 'users/create'

  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  resources :users

  resources :comments

end
