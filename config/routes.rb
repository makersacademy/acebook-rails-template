Rails.application.routes.draw do
  get 'pages/about'
  root "posts#index"

  resources :posts do
    get '/like', to: 'posts#like', on: :member
  end
  
end
