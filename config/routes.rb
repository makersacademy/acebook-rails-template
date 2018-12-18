Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  # devise_for :users,
  #            :skip => [:registrations, :sessions]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'pages#index'
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
  end
  resources :posts
end

