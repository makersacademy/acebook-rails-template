class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @usersposts = Post.where(user_id: post.recipient_id)
    @user = User.find_by(id: current_user.id)
  end

  def show
    if params[:id] == nil
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @recipientPosts = Post.where(recipient_id: params[:id])
  end

end
