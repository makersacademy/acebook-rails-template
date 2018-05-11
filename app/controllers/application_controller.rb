class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    if current_user
      render html: "Signup successful, welcome #{current_user.email}"
    else
      render html: "Hello"
    end
  end
end
