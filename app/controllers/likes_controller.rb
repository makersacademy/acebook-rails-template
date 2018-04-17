# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post
  # before_action :set_comment
  # before_action :find_like

  def create
    # Like.new(like_params)
    # Like.find_or_create

    # Don't destroy
    # Toggle the on column in table
    # Use find_or_create - if no likes, then create one and turn "on"
    #                    - if like already exists, then find it and toggle "on" to false

      # @post.likes.where(like_params).destroy(@post.likes.where(user_id: params[:user_id]).ids)

      # 0. find the like or create one.
      @like = Like.find_or_create_by(like_params)

      # 1. if the like is on, turn it off or vice versa
      if @like.on == true
        @like.update_attribute(:on, false)
      else
        @like.update_attribute(:on, true)
      end
      # SET DEFAULT VALUE OF ON TO TRUE IN MIGRATE

      # 2. redirect back to the post page
      redirect_to post_path(@post)
  end
  #
  # def update
  #   if @like
  #     p "UPDATE!!!!!!!!"
  #     @like[:on] = false
  #   end
  # end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # def set_comment
  #   @comment = Comment.find(params[:comment_id])
  # end

  # def find_like
  #   @like = Like.find_by(like_params)
  # end

  def like_params
    params.permit(:user_id, :post_id, :comment_id, :on)
  end
end
