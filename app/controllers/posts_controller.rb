class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def edit
    post = Post.find(params[:id])
    if !post.by_user?(current_user)
      flash[:alert] = "Error: can't update posts by other users"
      redirect_to posts_url
    elsif !post.within_time?(10) 
      flash[:alert] = "Error: can't update posts after 10 minutes"
      redirect_to posts_url
    else 
      @post = post
    end
  end

  def update
    @post = Post.update(post_params)
    redirect_to posts_url
  end

  def destroy 
    @post = Post.find(params[:id])
    if @post.user_id === current_user.id
      @post.destroy
    else 
      flash[:alert] = "Error: can't delete posts by other users"
    end 
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end
