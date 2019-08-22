require 'time'
class PostsController < ApplicationController
  respond_to? :html, :json
  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
    @username = @user.username
    @post = @user.posts.create(post_params)
    @post.update_attribute(:wall_id, session[:wall_id])
    redirect_back fallback_location: "www.bbc.co.uk"
  end


  def index
    @user = User.find(session[:user_id])
    session[:wall_id] = nil
    redirect_to root_path if session[:user_id] == nil
    @posts = Post.all.order(:id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])
    time_diff = (Time.current - @post.created_at)
    elapsed_time = (time_diff / 1.minute).round

    if @post.user_id != @user.id || elapsed_time > 10
      redirect_back fallback_location: "www.bbc.co.uk"
    else
      @post.update(post_params)
      redirect_to posts_url
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])
    if @post.user_id == @user.id
      @post.destroy
      redirect_back fallback_location: "www.bbc.co.uk"
    end
  end

  private

  def post_params
    p params
    p params.require(:post).permit(:message, :user_id, :post)

  end
end
