class UserController < ApplicationController
  def index
    @user_class = User
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
  end
end
