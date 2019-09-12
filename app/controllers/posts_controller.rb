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
    @user = User.find(current_user.id)
    @posts = @user.posts
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
