Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  get    'signup' =>  'users#new'
  post   'signup' =>  'users#create'

  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
