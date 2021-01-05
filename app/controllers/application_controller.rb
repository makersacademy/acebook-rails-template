class ApplicationController < ActionController::Base
  helper_method :current_user, :get_name
  
  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def get_name(id:)
    User.find_by(id: id).username
  end
end
