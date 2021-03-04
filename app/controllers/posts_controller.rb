# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to root_url
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to '/posts'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to '/posts'
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def post_params
    params.require(:post).permit(:message, :user_id, :image)
  end

  def correct_user
    @post = Post.find(params[:id])
    redirect_to posts_path, notice: 'No access' unless @post.user == current_user
  end
end
