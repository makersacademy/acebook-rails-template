Rails.application.routes.draw do
  get 'welcome/index'

  resources :users

  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  get '*path' => redirect('/users/new')
end
