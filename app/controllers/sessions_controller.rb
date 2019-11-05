class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect_to '/posts', notice: "Logged in!"
   else
     flash.now[:alert] = "Email or password is invalid"
     render "new"
   end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
    flash[:alert] = "You have been successfully logged out"
  end
end
