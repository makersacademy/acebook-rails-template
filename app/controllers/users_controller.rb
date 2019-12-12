class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: current_user.id)
  end

  def show
    if params[:id] == nil
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @recipient_posts = Post.where(recipient_id: params[:id]).order('created_at DESC')
  end
end
