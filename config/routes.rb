Rails.application.routes.draw do
  devise_for :people
  resources :people
  get 'login/index'
  get 'welcome/index'
  post 'welcome/index'
  get 'signup/index'
  # I don't actually think that we need any of the stuff above - I think that the routes are themselves defined in resources
  resources :posts

  root 'posts#index'
end
