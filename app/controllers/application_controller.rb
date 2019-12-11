# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to welcome_index_url
    end
  end

  def after_sign_in_path_for(_resource)
    user_path(current_user)
  end
end
