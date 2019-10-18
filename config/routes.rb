Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts do
    resources :comments
  end

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  get    'signup' =>  'users#new'
  post   'signup' =>  'users#create'
  get    'profile' => 'users#edit'
  post    'profile' => 'users#update'

  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
