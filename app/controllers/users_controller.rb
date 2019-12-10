class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @usersposts = Post.where(user_id: current_user.id)
    @user = User.find_by(id: current_user.id)
  end

  def show
    if params[:id] == nil
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @usersposts = Post.where(user_id: @user.id)
  end

end
