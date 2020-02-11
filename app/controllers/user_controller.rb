class UserController < ApplicationController
  def new
  end 

  def create
    
    @user = User.create(user_params)
    redirect_to posts_url
  end 

  private

  def user_params
    params.require(:user).permit(:username, :email, :firstname, :lastname, :password, :dateofbirth)
  end 
end
