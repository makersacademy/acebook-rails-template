# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def show; end

  def create
    if already_liked?
      flash[:liked] = 'You have already liked this post'
    else
      @post.likes.create(user_id: session[:user_id])
    end


    redirect_to user_posts_path(get_recipient)
  end

  def destroy
    @like.destroy
    redirect_to user_posts_path(get_recipient)
  end

  private

  def get_recipient
    post_id = params[:post_id]
    Post.find(post_id).recipient_id
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: session[:user_id], post_id: params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
