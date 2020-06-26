Rails.application.routes.draw do

  devise_for :students
  devise_for :mentors

  resources :mentors

  resources :students do
    resources :posts
  end


  root to: "pages#welcome"
  get "/students/:id/dashboard" => "students#show"
  get "/mentors/:id/dashboard" => "mentors#show"
end
