class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.wall.posts
  end
end
