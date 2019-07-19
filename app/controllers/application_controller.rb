class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to '/'
    end
  end
end
