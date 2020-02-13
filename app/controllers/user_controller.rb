class UserController < ApplicationController

  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end 

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.valid?
      redirect_to posts_url
    else
      flash[:alert] = "Email or Password not valid"
      redirect_to '/'
    end
   
  end 

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end 
end
