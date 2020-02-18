# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation)}
  #   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password,)}
  # end
end
