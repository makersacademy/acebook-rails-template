Rails.application.routes.draw do

  devise_for :students
  devise_for :mentors
  mount SimpleDiscussion::Engine => "/forum"

  resources :students
  resources :mentors
  namespace :simple_discussion do
    resources :forum_categories
  end

  root to: "pages#welcome"
  get "/students/:id/dashboard" => "students#show"
  get "/mentors/:id/dashboard" => "mentors#show"
end
