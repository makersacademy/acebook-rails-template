module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    if session[:user] 
      @current_user =  User.find(session[:user]["id"])
    end
  end
end