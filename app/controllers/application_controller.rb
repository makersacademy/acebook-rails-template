# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def require_login
    unless session[:user_id]
      redirect_to welcome_index_path
    end
  end
  
end
