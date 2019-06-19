Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome' => 'users#index'
  resources :posts, :users

  root :to => 'users#index'
end
