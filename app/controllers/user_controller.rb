class UserController < ApplicationController
  def new
  end 

  def create
    p user_params[:password].length
    if user_params[:password].length <= 10 && user_params[:password].length >= 6
      @user = User.new
      @user = User.create(user_params)

      session[:user_id] = @user.id
      redirect_to posts_url
    else 
      redirect_to '/login'
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end 
end
