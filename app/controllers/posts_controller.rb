# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :current_post, only: %i[show edit update destroy]
  def new
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
   end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    @user = User.find(session[:user_id])
    @post.destroy if @user.id == @post.user_id
    redirect_to posts_url
 end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def current_post
    @post = Post.find(params[:id])
  end
end
