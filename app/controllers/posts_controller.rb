# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action  :authenticated_user

  def new; end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_back(fallback_location: home_path)
  end

  def update
    @post = Post.find(params[:id])
    if time_passed?(@post) && post_owner?(@post)
      flash.now.alert = 'Apologies, you can only update your posts within 10 minutes!'
      render 'edit'
    elsif post_owner?(@post)
      @post.update(post_params)
      redirect_to session[:url]
    else
      flash.now.alert = 'Apologies, this is not your post to update!'
      render 'edit'
    end
  end

  def show; end

  def index
    @posts = Post.where('location_id IS NULL').order(created_at: :desc)
    session[:url] = request.original_fullpath
  end

  def destroy
    @post = Post.find(params[:id])
    if post_owner?(@post)
      @post.destroy
      redirect_to posts_path
    else
      flash.now.alert = 'Apologies, this is not your post to delete!'
      @posts = Post.order(created_at: :desc)
      render 'posts/index'
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :location_id)
  end

  def post_owner?(post)
    post.user_id == session[:user_id]
  end

  def time_passed?(post)
    10.minutes.ago - post.created_at >= 0
  end
end
