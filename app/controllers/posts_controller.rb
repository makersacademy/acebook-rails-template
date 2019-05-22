# frozen_string_literal: true

class PostsController < ApplicationController
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
    @posts = Post.all.order(created_at: :desc)
  end

  # GET request
  def show
    @post = Post.find(params[:id])
  end

  # DELETE request
  def destroy
    @posts = Post.destroy(params[:id])
  end


  private

  def post_params
    params.require(:post).permit(:message)
  end
end
