# frozen_string_literal: true

class PostsController < ApplicationController 
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy

    redirect_to posts_url
  end
  
  def update
    @post = Post.find_by_id(params[:id])
    permitted_columns = params.require(:post).permit(:message)
    @post.update_attributes(permitted_columns)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
