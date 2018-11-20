Rails.application.routes.draw do
  get 'welcome/index'

  resources :posts

  root to: 'welcome#index'

end
