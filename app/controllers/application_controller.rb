class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    p current_user
    current_user ? '/posts' : '/signup'
  end

end
