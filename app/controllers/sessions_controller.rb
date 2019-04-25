class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email_address].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      flash[:danger] = 'Invalid password'
      redirect_to login_path
      # show an error message
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
