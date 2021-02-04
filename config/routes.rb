Rails.application.routes.draw do
  
  get 'users/login'

    post '/users/authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, :users
end
