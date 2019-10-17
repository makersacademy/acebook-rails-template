Rails.application.routes.draw do
  resources :profile_pictures
  resources :albums do
    member do
      delete :delete_image_attachment
    end

    member do
      put "like" => "albums#like"
    end
  end


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :users
  resources :posts do
    member do
      put "like" => "posts#like"
    end
    resources :comments
  end

  # root '/'

end
