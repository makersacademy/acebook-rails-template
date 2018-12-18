Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  scope "/" do  
  	root to: 'homepage#index'
  end
end
