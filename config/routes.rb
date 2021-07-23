Rails.application.routes.draw do
  get 'pages/about'
  root "posts#index"

  resources :posts do
    get '/like', to: 'posts#like', on: :member
  end
<<<<<<< HEAD

  resources :users do
  end 
=======
  
>>>>>>> 54a2906066562116ed4928bb797435cd81a1cb0f
end
