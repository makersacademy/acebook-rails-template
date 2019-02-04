class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:sign_in_email])
    if user && authenticate(params[:sign_in_password])
      session[:user_id] = user.id
      redirect_to posts_url, notice: "Logged in as #{user.email}"
    else
      redirect_to root_url, notice: "Email or password is invalid"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You are now signed out"
  end
  
end
