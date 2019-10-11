module SessionsHelper
  def log_in(user)
    # logs in the given user
    session[:user_id] = user.id
  end

  def current_user
    # returns the current logged-in user(if any)
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
