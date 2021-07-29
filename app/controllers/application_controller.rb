class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,
                if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :location, :date_of_birth, :interests, :about_me, :current_password, :avatar)}
  end
end
