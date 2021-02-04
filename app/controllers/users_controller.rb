require 'bcrypt'

class UsersController < ApplicationController
  include BCrypt

  def new
    @user = User.new
  end

  def create
    hashed_password = BCrypt::Password.create(user_params["password"])
    User.create([{ username: user_params["username"], password: user_params["password"] }])
    redirect_to :controller => 'users', :action => 'login', alert: "You have signed up!"
  end

  def login
    @alert = params[:alert]
  end

  def index
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
