# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post
  before_action :find_like

  def create
    if @like
      @post.likes.where(like_params).destroy(@post.likes.where(user_id: params[:user_id]).ids)
    else
      @post.likes.create(like_params)
    end
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find_by(like_params)
  end

  def like_params
    params.permit(:user_id, :post_id)
  end
end
