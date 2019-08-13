Rails.application.routes.draw do
  get 'sessions/new'

  # get 'users/new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  root 'users#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get  '/help',    to: 'static_pages#help'
  # get  '/about',   to: 'static_pages#about'
  # get  '/contact', to: 'static_pages#contact'
  # get  '/signup',  to: 'users#new'
  # post '/signup',  to: 'users#create'
  resources :posts
  resources :users
  resources :sessions
end
