require 'time'
class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  # def ten_minutes_difference
  #   @post = Post.find(params[:id])
  #   updated_at = Time.parse(@post.updated_at.to_s)
  #   if (Time.parse(Time.now.to_s) - updated_at < 240)
  #     return true
  #   end
  # end

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
