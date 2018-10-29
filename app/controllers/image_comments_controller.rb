# frozen_string_literal: true

class ImageCommentsController < ApplicationController
  before_action :find_image_post
  include CommentsHelper

  def create
    @image_post.comments.create(user_id: current_user.id,
                                comment_text: params[:comment].values.join(''))
    redirect_to post_url(@image_post)
  end

  def show; end

  private

  def find_image_post
    @image_post = ImagePost.find(params[:post_id])
  end
end
