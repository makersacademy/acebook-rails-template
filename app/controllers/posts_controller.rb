# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id)) # could be a source of bugs
    redirect_to posts_url
  end

  def edit
    if Post.verify_user(current_user, Post.find(params[:id]))
      @post = Post.find(params[:id])
    else
      redirect_to posts_url
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
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
