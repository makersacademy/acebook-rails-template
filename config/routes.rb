Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    member do
      get 'wall_create'
  end
end

  get '/:user_name' => "posts#create_wall"
  root 'posts#index'
end
