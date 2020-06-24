Rails.application.routes.draw do
  get 'pages/home'

  devise_for :students, controllers: { registrations: "registrations" }
  devise_for :mentors, controllers: { registrations: "registrations" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#welcome"

end

