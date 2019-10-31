# frozen_string_literal: true
require_relative '../models/post'


class PostsController < ApplicationController

  respond_to :js, :html, :json 

  def new
    @post = Post.new
  end

  def like
    @post = Post.find(params[:id])
    if params[:format]=='like'
      @post.liked_by current_user
    elsif params[:format]=='unlike'
      @post.unliked_by current_user
    end
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
