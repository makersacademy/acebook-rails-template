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
    p "before"
    authenticate_user
    p "after"
    @posts = Post.all
    p "posts"
    p @posts
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def authenticate_user
    redirect_to '/' unless user_signed_in?
  end
end

