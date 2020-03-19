module SessionsHelper
  def successful_session(user)
    session[:current_user_id] = user.id
    flash[:notice] = "Log in successful!"
    redirect_to '/posts/yours'
  end
end
