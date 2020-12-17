class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.order(created_at: :desc).all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
