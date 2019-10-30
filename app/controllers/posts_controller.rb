# frozen_string_literal: true

class PostsController < ApplicationController # rubocop:todo Style/Documentation
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

  private

  def post_params
    params.require(:post).permit(:message, :time)
  end
end
