# frozen_string_literal: true

# Controller for the comments
class ProfilesController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = User.find(params[:id])
    @posts = Post.where(profile_message: params[:id])
    @post = Post.new
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: root_url)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to profile_path
  end
end
