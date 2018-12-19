class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def index
		redirect_to "/login"
	end

  def after_sign_in_path_for(resource)
     "/posts"
  end

  def after_sign_up_path_for(resource)
     "/posts"
  end

end
