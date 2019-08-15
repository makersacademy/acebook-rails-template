Rails.application.routes.draw do
<<<<<<< HEAD
=======
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> master

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  get  '/signup',  to: 'users#new'
  resources :posts
end
