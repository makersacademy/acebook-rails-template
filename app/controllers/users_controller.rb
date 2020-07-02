class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    p params
    p params[:user]
   
  
    @user = User.create(user_params)
    redirect_to posts_url
   
  end
  
  def index
    @posts = User.all
    @user_name = session[:user_name]
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
 end
 