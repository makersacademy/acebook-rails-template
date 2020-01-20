class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user_path(user)
  end

end
