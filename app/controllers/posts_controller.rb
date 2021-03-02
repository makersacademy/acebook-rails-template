# frozen_string_literal: true

class PostsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    # @post = Post.new
    @post = current_user.posts.build
  end

  def create
    # @post = Post.create(post_params)
    @post = current_user.posts.build(post_params)
    if @post.message == ""
      redirect_to new_post_url, notice: "Cannot post an empty message!"
    else
      @post.save
      redirect_to posts_url
    end
  end

  def index
    @posts = Post.all
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path, notice: "Exceeded ten minute marker for editing posts, you eejit!" unless Time.zone.now - @post.created_at < (60 * 10)

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_path, notice: "Not authorised!" if @post.nil?
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
