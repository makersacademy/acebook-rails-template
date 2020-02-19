require 'bcrypt'

class UserController < ApplicationController

  skip_before_action :redirect_if_not_logged_in, only: [:new, :create] 

  def new 
    @user = User.new
  end 

  def create 
    @user = User.create(user_params)
    
    session[:user_id] = @user.id
    if @user.valid? 
      redirect_to user_page_path(@user.id), notice: "You've successfully signed up!"
    elsif !!user_params
      flash[:notice] = "Email or Password not valid. Password must be 6-10 characters long."
      render 'new'
    end 
  end 

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end 
end
