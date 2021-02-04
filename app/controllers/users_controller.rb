require 'bcrypt'

class UsersController < ApplicationController
  include BCrypt

  def new
    @user = User.new
  end

  def create
    begin
      User.create!(username: user_params["username"], password: user_params["password"])
    rescue => exception
      flash[:alert] = exception.message
      redirect_to new_user_path
    else
      flash[:notice] =  "You have signed up!"
      redirect_to action: 'login'
    end 
  end

  def login
  end

  def index
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
