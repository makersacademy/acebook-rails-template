# frozen_string_literal: true
require_relative '../models/post'


class PostsController < ApplicationController

  respond_to :js, :html, :json

  def new
    @post = Post.new
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to posts_path
  end

    def unlike
      @post = Post.find(params[:id])
      @post.unliked_by current_user
      redirect_to posts_path
    end

  def create
      @post = Post.create(post_params)
      redirect_to posts_url
  end

  def index
    @posts = Post.getPostsDesc()
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
