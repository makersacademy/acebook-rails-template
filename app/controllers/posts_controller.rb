class PostsController < ApplicationController

  before_action :require_user, only: [:index, :show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order("updated_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
