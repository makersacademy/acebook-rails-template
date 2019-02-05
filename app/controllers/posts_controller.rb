# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create


    @post = current_user.posts.create(post_params)

    redirect_to @current_user
  end



  private

  def post_params
    params.require(:post).permit(:message)
  end
end
