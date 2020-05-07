Rails.application.routes.draw do
  get 'user/new'

  get 'user/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
