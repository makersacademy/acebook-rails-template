# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params, user_id: current_user.id)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    @current_post = Post.find(params[:id])
    if current_user.id == @current_post.user_id
      @post = Post.delete(params[:id])
    else
      flash[:no_delete] = 'You can only delete posts that you created. Classic Roku.'
    end
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])

    if current_user.id != @post.user_id
      flash[:no_edit] = 'You can only edit posts that you created. Classic Roku.'
      redirect_to '/posts'
    end

    unless @post.allow_update?
      flash[:edit_timeout_failure] = 'Sorry, you can only edit this post in the first 10 minutes after creation'
      redirect_to '/posts'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.allow_update?
      @post.message = post_params
      @post.save
    else
      flash[:edit_timeout_failure] = 'Sorry, you can only edit this post in the first 10 minutes after creation'
    end
    redirect_to posts_url
  end
  private

  def post_params
    params.require(:post).require(:message)
  end
end
