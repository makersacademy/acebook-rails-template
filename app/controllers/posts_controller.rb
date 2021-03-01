# frozen_string_literal: true

class PostsController < ApplicationController

  # Before action calls the login_required method from application controller,
  # to create a post you must be signed in
  before_action :login_required, :only => :new

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
