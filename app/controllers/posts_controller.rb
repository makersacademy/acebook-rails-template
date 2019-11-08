# frozen_string_literal: true

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end

    if @post.save
      redirect_to posts_url
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def not_editable?
    if current_user != @post.user
      flash[:alert] = "Sorry! You can't edit someone else's post."
    elsif (Time.now - @post.created_at) > 600
      flash[:alert] = "10 minutes exceeded: you can no longer edit the post."
    end
  end

  def edit
    @post = Post.where(id: params[:id]).first
    if not_editable?
      redirect_to posts_url
  else
    return if @post
    end
  end

  def update
    @post = Post.where(id: params[:id]).first

    if @post.update(message: params[:post][:message])
      flash[:notice] = 'Successfully updated the post!'
      redirect_to posts_url
    else
      flash[:alert] = 'Couldn’t edit the post...'
      render :edit
    end
  end

  def destroy
    @post = Post.where(id: params[:id]).first
    if current_user != @post.user
      flash[:alert] = "Sorry! You can't delete someone else's post."
    elsif @post.destroy
      flash[:notice] = 'Successfully deleted the post!'
    else
      flash[:alert] = 'Couldn’t delete the post...'
    end
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
