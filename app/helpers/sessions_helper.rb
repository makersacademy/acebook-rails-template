module SessionsHelper
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> sign in css

  def log_in(user)
    session[:user_id] = user.id
  end
<<<<<<< HEAD

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
=======
>>>>>>> feat: sessions controller
=======
  
>>>>>>> sign in css
end
