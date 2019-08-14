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
    p session[:current_session]
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
