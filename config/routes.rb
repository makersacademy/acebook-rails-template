Rails.application.routes.draw do

  get 'errors/not_found'
  unauthenticated do
    root to: 'home#index_logged_out', as: :unauthenticated_root
  end

  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end
  get '/profile/:username', to: 'user_profiles#show', as: :user_profile

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get "sign_up" => "devise/registrations#new" 
  end
  match "/404", to: "errors#not_found", via: :all


end
