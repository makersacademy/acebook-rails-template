class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.order('Created_at DESC').all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url

  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
