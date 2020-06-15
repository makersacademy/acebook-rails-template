# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login

  def redirect_to_login
    redirect_to login_url
  end

  private

  def require_login
    # redirect_to login_url unless session[:user_id]
    redirect_to login_url unless current_user
  end
end
