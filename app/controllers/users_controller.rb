require 'bcrypt'

class UsersController < ApplicationController
  include BCrypt

  def new
    @user = User.new
  end

  def create
    hashed_password = BCrypt::Password.create(user_params["password"])
    User.create([{ username: user_params["username"], password: user_params["password"] }])
    flash[:notice] =  "You have signed up!"
    redirect_to action: 'login'
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
