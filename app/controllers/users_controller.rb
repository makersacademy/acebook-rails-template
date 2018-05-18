class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @posts = @user.wall.posts
  end

  def index
    redirect_to user_path(current_user)
  end
end
