class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end 
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # config.autoload_paths << Rails.root.join('lib')
end