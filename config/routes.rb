Rails.application.routes.draw do
  # get 'users_new', to: 'users#new'
   resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  root to: "posts#index"

  get '/new', to: 'posts#new'

end
