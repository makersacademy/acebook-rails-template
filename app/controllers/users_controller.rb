class UsersController < ApplicationController

  def index
    @userposts = Post.where(user_id: current_user.id)
    @user = User.find_by(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @userposts = Post.where(user_id: @user.id)
  end

end
