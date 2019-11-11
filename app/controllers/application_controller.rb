class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :user_not_found
  protect_from_forgery with: :exception

  def user_not_found
    render :template => "errors/error_404_user", :status => 404
  end


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :username, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username, :password, :current_password) }
  end
  
end
