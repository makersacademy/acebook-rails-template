Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  get '/error', to: 'errors#404'
  get '/:id', to: "users#show", as: :user_wall

  resources :users, :posts, :comments
end
