class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(resource_or_scope)
  #   request.referrer
  # end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    else
      get '/users/sign_up'
    end
  end

end
