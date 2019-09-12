class PostsController < ApplicationController
  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    message = post_params["message"]
    user_id = current_user.id
    @post = Post.create(message: message, user_id: user_id)
    redirect_to posts_url
  end

  def index
    @posts = Post.all

  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
