# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post
  before_action :find_like

  def create
    # Like.new(like_params)
    # Like.find_or_create

    # Don't destroy
    # Toggle the on column in table
    # Use find_or_create - if no likes, then create one and turn "on"
    #                    - if like already exists, then find it and toggle "on" to false
    if @like
      @post.likes.where(like_params).destroy(@post.likes.where(user_id: params[:user_id]).ids)
    else
      @post.likes.create(like_params)
    end
    redirect_to post_path(@post)
  end

  def update
    # toggle "on"
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
