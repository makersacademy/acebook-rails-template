# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post

  def create
    if !@post.likes.find_by(like_params).nil?
      @post.likes.where(like_params).destroy(@post.likes.where(user_id: params[:user_id]).ids)
      redirect_to post_path(@post)
    else
      @post.likes.create(like_params)
      redirect_to post_path(@post)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.permit(:user_id, :post_id, :id)
  end
end
