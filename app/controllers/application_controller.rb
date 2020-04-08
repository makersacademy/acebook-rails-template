# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def create_session(id)
    session[:user_id] = id
  end
  
  helper_method :current_user, :create_session
end
