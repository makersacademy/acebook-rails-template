# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_reference

  def create
    @like = Like.find_or_create_by(like_params)

    if @like.on == true
      @like.update_attribute(:on, false)
    else
      @like.update_attribute(:on, true)
    end

    redirect_to posts_url
  end

  private

  def set_reference
    if params[:post_id].nil?
      @comment = Comment.find(params[:comment_id])
      @post = Post.find(@comment.post_id)
    else
      @post = Post.find(params[:post_id])
    end
  end

  def like_params
    params.permit(:user_id, :post_id, :comment_id, :on)
  end
end
