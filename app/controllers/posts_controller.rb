require 'pry'

class PostsController < ApplicationController
  def new
    # binding.pry
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.post.create(post_params)
    redirect_to user_posts_path(@user)
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end