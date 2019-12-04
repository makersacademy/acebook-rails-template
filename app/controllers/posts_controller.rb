class PostsController < ApplicationController

  before_action :redirect_if_user_is_not_signed_in

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.sortedbymostrecent
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
