class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def login_required
    if current_user.nil?
      flash[:danger] = 'Please log in to continue'
      redirect_to '/login' and return
    end
  end
end
