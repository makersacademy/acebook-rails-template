# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  private

  def require_login
    current_user = false
    if session[:user_id].nil?
      redirect_to '/login'
    end
  end
end
