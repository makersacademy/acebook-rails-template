# frozen_string_literal: true

# Controller for the image comments
class ImageCommentsController < ApplicationController
  before_action :find_post
  include CommentsHelper

  def create
    comment_params = { user_id: current_user.id,
                       comment: params[:image_comment].values.join('') }
    @image_post.image_comments.create(comment_params)
    redirect_to image_post_url(@image_post)
  end

  def show; end

  private

  def find_post
    @image_post = ImagePost.find(params[:image_post_id])
  end
end
