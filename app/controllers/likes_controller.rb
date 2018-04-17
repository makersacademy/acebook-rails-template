# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post
  # before_action :set_comment

  def create
    # Find the like or create one
    @like = Like.find_or_create_by(like_params)

    # If the like is on, turn it off or vice versa
    if @like.on == true
      @like.update_attribute(:on, false)
    else
      @like.update_attribute(:on, true)
    end
    # SET DEFAULT VALUE OF ON TO TRUE IN MIGRATE

    # Redirect back to the post page
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # def set_comment
  #   @comment = Comment.find(params[:comment_id])
  # end

  def like_params
    params.permit(:user_id, :post_id, :comment_id, :on)
  end
end
