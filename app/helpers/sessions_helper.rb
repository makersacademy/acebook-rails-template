module SessionsHelper
  def successful_session(user)
    session[:current_user_id] = user.id
    flash[:notice] = "Log in successful!"
    redirect_to '/posts/yours'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end
end
