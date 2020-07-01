Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  delete '/posts/:id', to: 'posts#destroy', as: 'destroy_post'
end
