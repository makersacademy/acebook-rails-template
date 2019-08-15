# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

private
def require_login
  unless user_signed_in?
    redirect_to new_user_session 
  end
end

end
