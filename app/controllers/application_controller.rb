class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
    render html: "Signup successful, welcome #{current_user.email}"
  end
end
