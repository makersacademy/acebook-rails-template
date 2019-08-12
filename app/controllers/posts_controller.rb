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
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    p @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
    
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
