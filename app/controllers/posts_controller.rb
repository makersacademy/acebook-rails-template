require 'time'
class PostsController < ApplicationController
  respond_to? :html, :json
  def new
    @post = Post.new
  end

  def create
    p @user = User.find(session[:user_id])
    p @username = @user.username
    p @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    p "All the single ladies"
    p session[:user_id]
    redirect_to root_path if session[:user_id] == nil
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])
    time_diff = (Time.current - @post.created_at)
    elapsed_time = (time_diff / 1.minute).round

    if @post.user_id != @user.id
      flash[:error] = "You can only edit your own posts";
      redirect_to posts_url
    elsif elapsed_time > 10
      flash[:error] = "It's too late to edit!";
      redirect_to posts_url
    else
      @post.update(post_params)
      flash[:error] = "Thanks for updating!";
      redirect_to posts_url
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])
    if @post.user_id != @user.id
      flash[:error] = "You can only delete your own posts"
      redirect_to posts_path
    else
      @post.destroy
      redirect_to posts_path
    end
  end

  private

  def post_params
    p params
    p params.require(:post).permit(:message, :user_id, :post)

  end
end
