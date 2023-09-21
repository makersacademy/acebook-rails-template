Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get "sign_up" => "devise/registrations#new" # 
  end
  
  # devise_for :users, :controllers => {
  #   registrations: 'registrations'
  # }
end
