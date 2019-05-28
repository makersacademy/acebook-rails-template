# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  # GET request
  def new
    @post = Post.new
  end

  # POST request
  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  # GET request
  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end

  # GET request
  def show
    @post = Post.find(params[:id])
  end

  # GET request
  def edit
    @post = Post.find(params[:id])
  end

  # DELETE request
  def destroy
    @posts = Post.destroy(params[:id])
    redirect_to posts_url
  end

  # PUT request
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
