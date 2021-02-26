# frozen_string_literal: true

class PostsController < ApplicationController
  # prepend_view_path "../views/main"

  # def self.controller_path
  #   "../views/main"
  # end

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
    params.require(:post).permit(:message)
  end
end
