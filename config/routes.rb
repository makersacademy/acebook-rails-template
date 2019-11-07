# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
      
  get 'welcome/index'
  root 'welcome#index'

  controller :posts do
    get '/new_post' => :new, as: 'new_post'
    # get '/post/:id' => :show, as: 'show_post'
    get '/post/:id/edit' => :edit, as: 'edit_post'
    patch '/post/:id/update' => :update, as: 'update_post'
    delete '/post/:id/delete' => :destroy, as: 'destroy_post'
  end


 

  resources :posts
end
