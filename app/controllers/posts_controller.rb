class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, user_id: session[:current_user_id])
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def yours
    @posts = Post.where user_id: session[:current_user_id]
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by User.find_by(id: session[:current_user_id])
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by User.find_by(id: session[:current_user_id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
    message = params[:post][:message]
    return message
  end

end
