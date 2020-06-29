Rails.application.routes.draw do

  get 'messages/index'

  get 'conversations/index'

  devise_for :students
  devise_for :mentors

  resources :mentors
  resources :students

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end


  root to: "pages#welcome"
  get "/students/:id/dashboard" => "students#show"
  get "/mentors/:id/dashboard" => "mentors#show"
end
