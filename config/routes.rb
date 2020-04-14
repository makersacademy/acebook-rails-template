Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
  root 'welcome#index'

end
