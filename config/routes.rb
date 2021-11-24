Rails.application.routes.draw do
  # root to: "posts#index"
  devise_for :user_sign_ins
  devise_scope :user_sign_in do 
    get "sign_in", to: "devise/sessions#new"
    get "signup", to: "devise/registrations#new"
    get "logout", to: "devise/sessions#destroy"
    root to: "devise/sessions#new"
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  
end
