# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  # This method ensures that the user is logged in, if not it will redirect back to homepage.
  def login_required
    redirect_to('/') if !Current.user
  end

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
