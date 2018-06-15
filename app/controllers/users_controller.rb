class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_id = params[:id]
    @user = User.find(params[:id])
    @posts = find_wall_posts
  end

  def index
    @users = User.all
  end

  private

  def find_wall_posts
    Post.where(recipient_id: @user.id).where(user_id: @user.id)
    .or(Post.where(user_id: @user.id).where(recipient_id: nil))
    .or(Post.where.not(user_id: @user).where(recipient_id: @user.id))
    .order(:id).reverse
  end
end
