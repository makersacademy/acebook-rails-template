# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
      :username,
      :email,
      :password,
      :password_confirmation
      )

    end
    # devise_parameter_sanitizer.permit(:account_update) {
  #   |u| u.permit(:first_name, :last_name, :password, :current_password)
  # }
  end

  def after_sign_in_path_for(_resource)
    posts_path
  end
end
