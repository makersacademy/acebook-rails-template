Rails.application.routes.draw do
  # resources :users, controller: 'users', only: [:create]

  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users, controller: 'users', only: [:create] do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[create edit update]
  end

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  root 'posts#index'

  # root 'application#index'
end
