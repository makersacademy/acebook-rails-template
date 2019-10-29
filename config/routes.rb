Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'static_pages#home'
  resources :posts

  root 'posts#index'

  devise_scope :user do
  match '/sign_up' => "devise/sessions#new", :as => :login, :via => [:get, :post]
end
end
