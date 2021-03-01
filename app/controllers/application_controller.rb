class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    '/posts'
  end

  # def configure_permitted_parameters
  #    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
  #
  #    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
  # end
  # before_action :authenticate
  #
  # def authenticate
  #   redirect_to(root_path) unless current_user.nil?
  # end

end
