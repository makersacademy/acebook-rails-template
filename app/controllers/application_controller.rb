# frozen_string_literal: true

require_relative '../models/sessions.rb'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  p session[:current_session]
  #   before_action :require_login
  #
  #   private
  #
  #   current_session = session[:current_session]
  #   def require_login
  #     redirect_to login_url unless current_session
  # end
end
