# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params_hash = params.require(:post).permit(:message)
    params_hash["user_id"] = Current.user.id
    params_hash
  end
end
