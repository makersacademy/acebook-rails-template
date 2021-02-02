Rails.application.routes.draw do
  resources :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'posts#index'
  get '/posts', to: 'posts#index'
end
