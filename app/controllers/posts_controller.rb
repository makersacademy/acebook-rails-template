class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:post_content)
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end
end
