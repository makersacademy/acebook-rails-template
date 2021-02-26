class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:home]

  private

    def authenticate_user!
      allowed_paths = [root_path, new_user_registration_path, new_user_password_path, user_registration_path, new_user_session_path]
      if user_signed_in?
        super
      else
        redirect_to root_path, notice: "Please login to view that page!" if !allowed_paths.include?(request.original_fullpath)
      end
    end


end
