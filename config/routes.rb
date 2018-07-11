Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/', to: 'homepage#index'
  get '/signup', to: 'users#new'
  post '/likes', to: 'posts#likes'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do

    member do
      get :following, :followers
    end

    resources :posts do
      resources :likes
      resources :comments
    end

  end
end
