require 'bcrypt'

class UsersController < ApplicationController
  include BCrypt

  def index
  end

  def new
    @user = User.new
  end

  def create
    begin
      User.create!(username: user_params["username"], password: user_params["password"])
    rescue => exception
      flash[:alert] = exception.message
      redirect_to new_user_path
      # if invalid user, flashes error message & goes back to users/new
    else
      flash[:notice] =  "You have signed up!"
      redirect_to action: 'login'
    end 
  end

  def login
    @user = User.new
  end

  def authenticate
    user = User.find_by(username: user_params["username"])
    if user.authenticate(user_params["password"])
      flash[:notice] =  "You have logged in!"
      redirect_to action: 'index'
    else
      flash[:alert] =  "Incorrect username or password"
      redirect_to action: 'login'
       # if invalid login, flashes error message & goes back to users/login
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
