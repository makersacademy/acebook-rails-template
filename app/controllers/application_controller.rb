class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:student, :mentor]
end
