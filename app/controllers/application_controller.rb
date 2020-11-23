# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  private

  def require_login
    return unless session[:user_id].nil?
    redirect_to '/login'
  end
end
