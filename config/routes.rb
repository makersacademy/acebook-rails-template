Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, :users
  # root 'users#new'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'users#login'
  post '/login' => 'sessions#create'

end
