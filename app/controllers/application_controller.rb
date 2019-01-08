class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    current_user ? user_path(resource) : '/signup'
  end
  private

    def require_login
      unless current_user
        redirect_to login_url
      end
    end
end
