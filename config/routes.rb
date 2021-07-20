Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    get '/like', to: 'posts#like', on: :member
  end

  resources :users do
    # get '/new', to: 'users#new' 
  end 
end
