class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to posts_path, notice: "Logged in!"
      # :action => post_path, :id => user.id, notice: "You successfully logged in!"
    else
      redirect_to root_url, notice: "Email or password is invalid"  
      #flash.now[:alert] = "Email or password is invalid"      
      # render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
