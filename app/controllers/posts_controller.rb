class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
    @post = Post.new
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to posts_url, :notice => "Post has been updated"
  end
  private

  def post_params
    params.require(:post).permit(:message)
  end
end
