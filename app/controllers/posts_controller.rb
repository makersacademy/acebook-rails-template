# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    user = current_user
    params = post_params
    params[:user_id] = user.id
    @post = Post.create(params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order("created_at DESC")
  end

  private

    def post_params
      params.require(:post).permit(:message)
    end
end
