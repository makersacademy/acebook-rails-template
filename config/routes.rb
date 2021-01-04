Rails.application.routes.draw do
  get 'pages/home'

  devise_for :users
  resources :posts



  unauthenticated :user do
    root "pages#home", as: :unauthenticated_root
  end


  authenticated :user do
    # root :to => "posts#index"
  root "posts#index", as: :authenticated_root
  end

end
