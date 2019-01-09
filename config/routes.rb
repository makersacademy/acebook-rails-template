Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'
  resources :posts
  match 'users/:id' => 'users#show', via: :get, as: 'profile_page'
end
