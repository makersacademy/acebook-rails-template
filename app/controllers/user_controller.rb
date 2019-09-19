class UserController < ApplicationController
  def index
    @user_class = User
    @users = User.all
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
  end
  def show
    @user = current_user
  end
end
