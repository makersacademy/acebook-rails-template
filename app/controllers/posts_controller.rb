# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    params_with_user = post_params
    post_params[:user_id] = current_user.id
    @post = Post.create(params_with_user)
    redirect_to posts_url
  end

  def index
    # This method is getting all posts from database and sorting by created_at
    @posts = Post.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
