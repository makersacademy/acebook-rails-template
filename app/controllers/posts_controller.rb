class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    p @post.created_at
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def time_format
    
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
