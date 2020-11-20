require_relative '../helpers/posts_helper.rb'
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order("created_at Desc").all
    if session[:user]
      @user = session[:user]
    end
  end

  def like
    @post = Post.find_by(params[:id])
    @user = User.find_by(id: session[:user]["id"])
    @post.like(@user)
    redirect_to posts_url
  end
  
  def comment
    @user = User.find_by(id: session[:user]["id"])
    @post = Post.find_by(id: params[:post_id])
    @post.comment(@user, params[:comment_text])
    redirect_to posts_url
  end

  private

  def post_params
    params.permit(:message, :user_id)
  end
end
