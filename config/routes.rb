Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'users/registrations', confirmations: 'users/confirmations', sessions: 'users/sessions', mailer: 'users/mailer', passwords: 'users/passwords', shared: 'users/shared', unlocks: 'users/unlocks' }


  resources :posts
  resources :users

  root 'home#index'

end
