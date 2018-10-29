# frozen_string_literal: true

# Controller for Likes - Manages creation and destruction of likes
class ImageLikesController < ApplicationController
  before_action :find_posts
  before_action :find_like, only: [:destroy]

  def create
    unless already_liked?
      @image_post.image_likes.create(
        user_id: current_user.id
      )
    end
    redirect_to image_post_url(@image_post), notice: 'You have liked.'
  end

  def destroy
    @image_like.destroy if already_liked?

    redirect_to image_post_url(@image_post), notice: 'You have disliked.'
  end

  private

  def already_liked?
    ImageLike.where(user_id: current_user.id,
                    image_post_id: params[:image_post_id]).exists?
  end

  def find_like
    @image_like = @image_post.image_likes.find(params[:id])
  end

  def find_posts
    @image_post = ImagePost.find(params[:image_post_id])
  end
end
