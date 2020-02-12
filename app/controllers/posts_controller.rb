class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p "user"
    p @current_user = session[:user_id]
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @current_user = session[:user_id]
    @posts = Post.all
  end

  private

  def post_params
    p 'params'
    p params[:id] = @current_user
    p params.require(:post).permit(:message, :id)
  end
end
