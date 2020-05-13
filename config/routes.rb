Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, :users
  get 'sessions/new'
  post 'sessions', to: 'sessions#create'
  get 'sessions/show'
  delete 'sessions', to: 'sessions#destroy' 
  root 'users#new'
end
