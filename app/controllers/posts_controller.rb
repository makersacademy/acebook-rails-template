class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user: current_user))
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all
    @like = Like.new
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
