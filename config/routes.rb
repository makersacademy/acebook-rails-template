Rails.application.routes.draw do
  get 'comments/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, :comments
end
