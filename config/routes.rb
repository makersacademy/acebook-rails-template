Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    member do
      put "like" =>"posts#like"
    end
  end
  
  root :to => 'home#index'
  mount Commontator::Engine => '/commontator'
end
