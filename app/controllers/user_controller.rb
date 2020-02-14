require 'bcrypt'

class UserController < ApplicationController

  skip_before_action :redirect_if_not_logged_in, only: [:new, :create] # helper

  def new # action - localhost:3000/user/new
    @user = User.new
  end 

  def create # crud method - to create a user
    @user = User.create(user_params)
    p user_params
    session[:user_id] = @user.id # saves the user id in the session
    if @user.valid? # if the user is really valid
      p "i'm in the if statement"
      redirect_to posts_url, notice: "You've successfully signed up!" # redirect to localhost:3000/posts and show a pop-up message
    else # otherwise show another pop-up message 
      "i'm in else"
      flash[:alert] = "Email or Password not valid. Password must be 6-10 characters long."
    end 
    p "leaving method"
    #redirect_to '/' 
  end 

  private

  def user_params # helper method linked to the args in the user_params method
    params.require(:user).permit(:email, :password)
  end 
end
