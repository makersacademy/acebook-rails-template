class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = true
      redirect_to user_url(user.id)
    else
      flash[:alert] = "Incorrect username or password"
      redirect_back fallback_location: "/"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/", notice: "Logged out!"
  end
  
end
