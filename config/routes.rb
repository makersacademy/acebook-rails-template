Rails.application.routes.draw do
  get '/signup', to: 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
