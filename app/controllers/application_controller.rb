# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: param_string)
    devise_parameter_sanitizer.permit(:account_update, keys: bio_param_string)
  end

  def param_string
    %i[username firstname lastname birthday avatar]
  end

  def bio_param_string
    %i[username firstname lastname birthday bio avatar]
  end
end
