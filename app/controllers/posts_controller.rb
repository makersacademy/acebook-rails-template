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
    @posts = Post.all.order('created_at DESC')
  end

  def destroy
    @post = Post.find(params[:id])
    @post = Post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
