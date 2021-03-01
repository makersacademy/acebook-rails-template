# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'users#index'

  root to: 'main#index'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create' # format: :js

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create' # format: :js

  delete 'logout', to: 'sessions#destroy'

  resources :posts
end
