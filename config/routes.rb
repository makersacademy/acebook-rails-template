Rails.application.routes.draw do
  resources :bios
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#homepage'
  resources :posts
end
