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
    @posts.order! 'created_at DESC'
  end

  def yours
    @posts = Post.where users_id: session[:current_user_id]
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where posts_id: @post.id
    @comments.order! 'created_at DESC'
    session[:current_post_view] = @post.id
    @comment = Comment.new
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
