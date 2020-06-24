Rails.application.routes.draw do
  resources :tests
  get 'pages/home'

  devise_for :users
  get 'mentor/index'

  get 'mentor/show'

  get 'student/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  root to: "posts#new"

  root to: "pages#home"
end
