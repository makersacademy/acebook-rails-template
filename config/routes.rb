Rails.application.routes.draw do
  get 'profile/show'
  devise_for :users

  devise_scope :user do
    get '/users/edit' => 'devise/registrations#edit'
  end

  resources :posts
  resources :profile
  resources :users, only: [:create, :new, :show, :edit, :update]
  root to: 'posts#index'
  
end


