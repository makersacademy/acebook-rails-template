Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :posts

  root 'posts#index'
end
