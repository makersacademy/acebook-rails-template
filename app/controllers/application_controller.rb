# frozen_string_literal: true

class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  include SessionsHelper
  include Response
  include ExceptionHandler

  before_action :require_login

  def redirect_to_login
    redirect_to login_url
  end

  private

  def require_login
    # redirect_to login_url unless session[:user_id]
    json_response(status: 401) unless current_user
  end
end
