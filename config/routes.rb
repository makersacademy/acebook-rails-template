Rails.application.routes.draw do
  get 'mentor/index'

  get 'mentor/show'

  get 'student/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
