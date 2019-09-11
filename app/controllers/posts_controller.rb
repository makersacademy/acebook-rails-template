class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    ordered_posts = Post.order("created_at DESC")
    @posts = ordered_posts
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
