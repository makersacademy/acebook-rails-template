class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, users_id: session[:current_user_id])
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def yours
    @posts = Post.where users_id: session[:current_user_id]
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
    message = params[:post][:message]
    return message
  end

end
