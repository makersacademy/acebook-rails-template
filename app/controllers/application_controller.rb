class ApplicationController < ActionController::Base
  include Clearance::Controller
  # before_action :require_login 
  protect_from_forgery with: :exception

  # private 

  # def require_login
  #   unless logged_in?
  #     p "not logged in"
  #     p current_user
  #     p clearance_session.current_user
  #     flash[:error] = "Error: please sign in"
  #     redirect_to '/sign_in'
  #   end
  # end



  # def logged_in?
	# 	!current_user.nil?
	# end
end
