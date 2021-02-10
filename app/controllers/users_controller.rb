require 'bcrypt'

class UsersController < ApplicationController
  include BCrypt
  skip_before_action :require_login, except: [:show, :log_out]

  def index
    if session[:user] #if user is already logged in
      redirect_to action: 'show', id: session[:user]["id"]
    else
      @disable_nav = true
      @user = User.new
      # shows log in / sign up page
    end
  end

  def create
    begin
      User.create!(user_params)
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
    else
      flash[:danger] =  "Incorrect username or password"
       # if invalid login, flashes error message & goes back to users/login
    end
    redirect_back fallback_location: "/"
  end

  def show
    @friend_status = Friend.find_by(requester_id: session[:user]["id"], receiver_id: params[:id])
    @user = User.find(params[:id])
    @post = Post.new #for adding new posts
    @posts = @user.posts.order(created_at: :desc)
  end

  def log_out
    session[:user] = nil
    flash[:primary] =  "You have logged out"
    redirect_to "/"
  end
  
  private

  def user_params
    params.require(:user).permit(:username, :password, :full_name, :email, :mobile, :address, :url)
  end

end