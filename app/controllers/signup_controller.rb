class SignupController < ApplicationController

  def new
    @user = Signup.new
  end

  def create
    @user = Signup.create(signup_params)
    session[:user] = Signup.find_by(params.require(:signup).permit(:username))
    session[:user_id] = Signup.find_by(params.require(:signup).permit(:username)).id
    # session[:username] = Signup.find_by(params.require(:signup).permit(:username)).username
    redirect_to posts_url
  end

  def index
    @user = Signup.all
  end

  private

  def signup_params
    params.require(:signup).permit(:username, :password, :email)
  end


end
