require 'time'
class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
    else
      flash[:notice] = "Thats not your post to delete"
    end
    redirect_to posts_path

  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      flash[:notice] = "This is not your post to update"
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:message))
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
