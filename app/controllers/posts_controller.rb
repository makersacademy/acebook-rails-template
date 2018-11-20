class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
    @posts = Post.order('updated_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
