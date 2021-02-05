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
      flash[:danger] = exception.message
      # if invalid user, flashes error message
    else
      flash[:primary] =  "You have signed up!"
    end 
      redirect_back fallback_location: "/"
  end

  def authenticate
    user = User.find_by(username: params["username"])
    if user && user.authenticate(params["password"])
      session[:user] = user
      flash[:primary] =  "You have logged in!"
      redirect_to action: 'show', id: user.id 
    else
      flash[:danger] =  "Incorrect username or password"
      redirect_back fallback_location: "/"
       # if invalid login, flashes error message & goes back to users/login
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new #for adding new posts
    @posts = Post.where(user_id: params[:id])
  end

  def log_out
    session[:user] = nil
    flash[:primary] =  "You have logged out"
    redirect_to "/"
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end