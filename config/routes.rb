Rails.application.routes.draw do
  

  get 'welcome/index'

  get 'sessions/new'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/posts/yours", to: "posts#yours"
  get "posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show", as: 'post'
  
  resources :posts do
    member do
      put "like" => "posts#like"
      put "unlike" => "posts#unlike"
    end
  end
  
  resources :comments, only: [:create]

  get '*path' => redirect('/users/new')
end
