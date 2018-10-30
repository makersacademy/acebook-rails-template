# frozen_string_literal: true

# Controller for the comments
class ProfilesController < ApplicationController
  before_action :authenticate_user!


  def create
    @post.comments.create(user_id: current_user.id,
                          comment_text: params[:comment].values.join(''))
redirect_back(fallback_location: root_url)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @post = Post.new

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
