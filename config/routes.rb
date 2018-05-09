Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'

  get "/users" => "application#hello"
  #post "/users" => "application#hello"
  resources :posts
end
