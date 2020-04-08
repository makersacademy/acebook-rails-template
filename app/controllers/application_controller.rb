# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :require_login

  # private

  # def current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end

  # def require_login
  #   unless current_user
  #     redirect_to root_url
  #   end
  # end

end
