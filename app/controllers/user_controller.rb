class UserController < ApplicationController

  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end 

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    # redirect_to posts_url # not to link to login
  end 

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end 
end
