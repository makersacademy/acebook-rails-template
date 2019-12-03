Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :posts

  delete 'users/sign_out'

  root 'welcome#index'

end
