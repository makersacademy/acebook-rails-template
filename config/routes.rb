Rails.application.routes.draw do
  

  get 'welcome/index'

  get 'sessions/new'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts/yours", to: "posts#yours"
  
  resources :posts do
    member do
      put "like" => "posts#like"
      put "unlike" => "posts#unlike"
    end
  end

  get "posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show", as: 'post'

  resources :comments, only: [:create]

  get '*path' => redirect('/users/new')
end
