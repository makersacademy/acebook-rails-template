Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
    controller: "clearance/passwords",
    only: [:edit, 
          :update]
  end

  resources :posts

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  post "/posts/:id/edit" => "posts#update"
  root 'welcome#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
