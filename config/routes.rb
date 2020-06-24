Rails.application.routes.draw do
  get 'pages/home'

  devise_for :students
  devise_for :mentors

  resources :students
  resources :mentors

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#welcome"

end

