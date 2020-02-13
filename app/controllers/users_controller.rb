class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @current_user = User.create(params.require(:user).permit(:username, :password))
    session[:users_id] = @current_user.id
    redirect_to '/posts/index'
  end
end
