Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> chore: review duplicated code and linting
  root 'posts#index'
  get 'pages/about'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

<<<<<<< HEAD
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
=======
  get 'sessions/new'
  get 'pages/about'
  root "posts#index"
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
>>>>>>> sign in css

=======
>>>>>>> chore: review duplicated code and linting
  resources :posts do
    get '/like', to: 'posts#like', on: :member
  end

  resources :users do
  end 
end
