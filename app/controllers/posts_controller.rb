class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p post_params["message"]
    p session[:current_user_id]
    @post = Post.create(message: post_params["message"], user_id: session[:current_user_id])
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
    @current_user = User.find_by_id(session[:current_user_id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
