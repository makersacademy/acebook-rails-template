# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login

  private

  def require_login
    redirect_to login_url unless session[:user_id]
  end
end
