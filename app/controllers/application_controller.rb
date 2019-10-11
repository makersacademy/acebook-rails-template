class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :email, :password, :password_confirmation, :current_password) }
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end


end
