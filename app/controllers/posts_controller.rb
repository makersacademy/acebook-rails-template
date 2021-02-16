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

  private

  def post_params
    post_params = params.require(:post).permit(:user_id, :content)
    post_params[:user_id] = session[:user_id] if post_params[:user_id].nil?
    return post_params
  end
end
