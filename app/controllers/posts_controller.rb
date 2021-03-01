# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.new(post_params)
    @post.save
    if @post.save
      redirect_to root_path, notice: 'Post successfully created'
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
