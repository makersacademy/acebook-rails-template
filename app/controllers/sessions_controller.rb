class SessionsController < ApplicationController

  attr_reader :error

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect_to "/users/#{session[:user_id]}", notice: "Logged in!"
   else
     flash[:warning] =  "Email or password is invalid"
     redirect_to '/'
   end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
    flash[:notice] = "You have been successfully logged out"
  end
end
