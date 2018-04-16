# frozen_string_literal: true

class PostsController < ApplicationController
  # before_action :set_user_id
  before_action :correct_user, only: %i[edit update destroy]

  def correct_user
    @post = Post.find(params[:id])
    redirect_to posts_path unless current_user.id == @post.user.id
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :id, :user_id)
  end
end
