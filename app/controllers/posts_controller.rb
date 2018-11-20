# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, user_id: session[:user_id])
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('updated_at DESC')
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    redirect_to posts_url if @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:danger] = "You cannot delete someone else's post"
      redirect_to posts_url
    else
      @post.destroy
      redirect_to posts_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
