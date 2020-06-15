# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticate_user, :save_login_state

  protected

  def authenticate_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      true
    else
      redirect_to('/')
      false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to('/posts/index')
      false
    else
      true
    end
  end
end
