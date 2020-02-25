module SessionsHelper
  def log_in(user)
    # logs in the given user
    session[:user_id] = user.id
  end

  def current_user
    # returns the current logged-in user(if any)
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def authenticated?
    session[:user_id] == @post.user_id || session[:user_id] == @post.recipient_id
  end
end
