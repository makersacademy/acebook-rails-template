class SessionsController < ApplicationController
  def new
  end
  
  def create
    
    user = User.find_by(email: params[:session][:email_address].downcase)
    if user # need to authenticate here as well
      session[:user_id] = user.id
      redirect_to posts_path
    else
      redirect_to login_path
      # show an error message
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
