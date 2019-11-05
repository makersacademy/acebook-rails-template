Rails.application.routes.draw do
  get '/home/index'

  resources :posts do
    member do
      put 'like', to: "posts#like"
      put 'unlike', to: "posts#unlike"
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"



end
