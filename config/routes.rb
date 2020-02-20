Rails.application.routes.draw do
   # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show"
  end

  get 'homepage/index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    resources :posts
  end

  resources :posts

  root 'homepage#index'
end
