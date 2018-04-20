Rails.application.routes.draw do
  root 'home#index'

  devise_scope :user do
     get "/avatar" => 'registrations#avatar'
     put "/avatar" => 'registrations#create_avatar'
   end

  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
    resources :likes
  end

  resources :comments do
    resources :likes
  end
end
