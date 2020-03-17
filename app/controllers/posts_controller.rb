class PostsController < ApplicationController

  # respond_to :js, :html, :json

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

  def like
    @post = Post.find(params[:id])
    if params[:format] == 'like'
      @post.liked_by @current_user
    elsif params[:format] == 'unlike'
      @post.unliked_by @current_user
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
    message = params[:post][:message]
    return message
  end

end
