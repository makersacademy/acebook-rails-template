Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'posts#index'
  resources :posts
end

devise_for :users, skip: [:sessions]
as :user do
  get 'site-admin/login', to: 'devise/sessions#new', as: :new_user_session
end