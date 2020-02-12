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
    @posts = Post.all
  end

  # def show_post
  #   @post = Post.find(params[:id])

  # end

  # def delete_post
  #   @post = Post.find(params[id])
  #   @post.destroy
  #   redirect_to post_path
  # end

  private

  def post_params
    params.require(:post).permit(:message, :time)
  end
end
