# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || posts_path
  end

  before_action :authenticate_user!

  # def authenticate_user!
  #   if user_signed_in?
  #     super 
  #   else
  # end

end
