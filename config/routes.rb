Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user#new'
  
  resources :posts do
    resources :comments
  end
  resources :users
  resources :sessions
  resources :errors
  resources :walls

  %w( 404 ).each do |code|
    get code, :to => "errors#index", :code => code
  end

  get 'signup' => 'user#new'  
  post 'signup' => 'user#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get '/:user_id' => 'wall#show'

  get 'posts/:user_id/new' => 'posts#new'

  get 'posts' => 'posts#index'
  patch 'posts' => 'posts#edit'
  delete 'posts' => 'posts#delete'
end
