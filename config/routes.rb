Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'pages#index'
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  resources :posts
end
