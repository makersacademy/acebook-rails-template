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
      :password_confirmation,
      :avatar
      )

    end
    # devise_parameter_sanitizer.permit(:account_update) {
  #   |u| u.permit(:first_name, :last_name, :password, :current_password)
  # }
  end

  def content_not_found
    render file: "#{Rails.root}/public/404", layout: true, status: :not_found
  end

  def after_sign_in_path_for(_resource)
    user_post_path(id: current_user.id)
  end
end
