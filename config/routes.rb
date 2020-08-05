Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resources :posts

  root 'sessions#welcome'

  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#create'

  # get 'logout', :controller => 'sessions', :action => 'destroy'
  get 'logout', to: 'sessions#destroy'
  get '/:user_id', to: 'posts#index'

  # map.resource :session

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
