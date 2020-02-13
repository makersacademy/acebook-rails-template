class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticate_user, :save_login_state

  protected 

  def authenticate_user
    if session[:user_id]
      @current_user = User.find(id: session[:user_id])
      return true	
    else
      redirect_to('login')
      return false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to('/posts/index')
      return false
    else
      return true
    end
  end
  
end
