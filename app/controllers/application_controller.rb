class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login, except:[new_user_registration]

  private

  def require_login
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
