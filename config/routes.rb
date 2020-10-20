Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts

  DELETE '/posts/:id', to: 'posts#destroy', as: 'destroy_posts_path'
  #delete '/posts/:id' => 'posts#destroy'
end
