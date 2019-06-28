Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :posts, :users, :sessions
  delete '/sessions/destroy', to: 'sessions#destroy', as: :destroy_session

  match '/404', to: 'errors#not_found', via: :all
end
