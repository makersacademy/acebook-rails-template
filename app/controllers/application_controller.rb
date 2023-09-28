class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_previous_path 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :isAgeOver13])
  end

  def after_sign_in_path_for(resource)
    posts_path # Replace with your desired path
  end


  private

  def store_previous_path
    session[:previous_path] = request.referer
  end
  
end
