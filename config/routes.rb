Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  get 'welcome/index'

  resources :posts

  delete 'users/sign_out'

  root 'welcome#index'

end
