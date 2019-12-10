class UsersController < ApplicationController

  def index
    @userposts = Post.where(user_id: current_user.id)
    @user = User.find_by(id: current_user.id)
  end

  def users
    redirect_to user_path(current_user)
  end

  def show
    if params[:id] == nil
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @userposts = Post.where(user_id: @user.id)
  end

end
