Rails.application.routes.draw do
  get 'users/new'
  get 'posts/index'
  post "posts/:id/edit" => "posts#edit"
  patch "posts.:id" => "posts#update"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts  

  root 'users#new'

end
