Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    get '/like', to: 'posts#like', on: :member
  end

  resources :users do
    # get '/new', to: 'users#new' 
  end 
end
