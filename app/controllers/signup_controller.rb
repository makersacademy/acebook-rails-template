class SignupController < ApplicationController

  def new
    @user = Signup.new
  end

  def create
    @user = Signup.create(signup_params)
    session[:user] = Signup.find_by(params.require(:signup).permit(:username)).id
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
