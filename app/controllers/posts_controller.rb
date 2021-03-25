# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @user = current_user
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
