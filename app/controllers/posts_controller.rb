class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
