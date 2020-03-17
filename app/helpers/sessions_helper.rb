module SessionsHelper
  def log_out
    # session.delete(:user_id)
  end

  def current_user
    if session[:current_user_id]
      @current_user ||= User.find_by(id: session[:current_user_id])
    end
  end

end
