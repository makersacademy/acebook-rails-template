Rails.application.routes.draw do
  resources :comments
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password, only: [:edit, :update],
    controller: "clearance/passwords"
  end

  resources :posts

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'posts#index', as: :posts_root
  end

  get "/sign_in" => "sessions#new"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/:id" => "posts#wall", as: "user_wall"

  post "/posts/:id/edit" => "posts#update"
  root 'sessions#new#title'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
