# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:danger] = "You can't edit that post!"
      redirect_to posts_path
    end
  end

  def create
    user = current_user
    params = post_params
    params[:user_id] = user.id
    @post = Post.create(params)
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private

    def post_params
      params.require(:post).permit(:message)
    end
end
