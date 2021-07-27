Rails.application.routes.draw do
  get 'pages/about'
  root "posts#index"

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :posts do
    get '/like', to: 'posts#like', on: :member
  end

  resources :users do
  end 
end
