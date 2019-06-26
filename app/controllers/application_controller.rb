# frozen_string_literal: true
require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def require_login
    return unless session[:user_id].nil?

    flash[:have_to_log_in_error] = 'You must be logged in to visit the page'
    redirect_to root_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
 