require 'bcrypt'

class UsersController < ApplicationController
  include BCrypt
  skip_before_action :require_login

  def index
    @user = User.new
  end

  def create
    begin
      User.create!(username: user_params["username"], password: user_params["password"])
    rescue => exception
      flash[:alert] = exception.message
      # if invalid user, flashes error message & goes back to users/new
    else
      flash[:notice] =  "You have signed up!"
    end 
      redirect_to action: "index"
  end

  def authenticate
    user = User.find_by(username: user_params["username"])
    if user.authenticate(user_params["password"])
      session[:user] = user
      flash[:notice] =  "You have logged in!"
      redirect_to controller: "posts", action: "index"
    else
      flash[:alert] =  "Incorrect username or password"
      redirect_to action: 'index'
       # if invalid login, flashes error message & goes back to users/login
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
