# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = "Post was updated"
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
    p @post
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
