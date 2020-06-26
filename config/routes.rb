Rails.application.routes.draw do

  devise_for :students
  devise_for :mentors

  resources :students
  resources :mentors

  resources :posts do
    resources :students
  end


  root to: "pages#welcome"
  get "/students/:id/dashboard" => "students#show"
  get "/mentors/:id/dashboard" => "mentors#show"
end
