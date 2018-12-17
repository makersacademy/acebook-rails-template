Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home_page#home'
  get 'sign_up' => 'home_page#sign_up'
end
