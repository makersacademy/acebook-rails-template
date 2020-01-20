Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  root to: 'posts#index'
  resources :users
=======
  get '/user/:id', to: 'users#wall', as: :user_page
  root to: 'users#wall'
>>>>>>> b793dc34ab9f2b354ca5354bdf610f6075923e68
  resources :posts
end
