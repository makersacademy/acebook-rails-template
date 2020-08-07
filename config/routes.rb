Rails.application.routes.draw do
  resources :follows
  resources :posts
  devise_for :people
  resources :people
  # get 'login/index'
  # get 'welcome/index'
  # post 'welcome/index'
  # get 'signup/index'
  # I don't actually think that we need any of the stuff above - I think that the routes are themselves defined in resources

  root 'posts#index'
end
