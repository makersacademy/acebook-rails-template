class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to '/'
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @post = Post.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :full_name, :desired_attribute, :birthday, :profile_picture)
  end
end
