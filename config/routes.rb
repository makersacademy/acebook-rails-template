Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users

  get 'users/:id' => 'users#profile'

  resources :posts

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
