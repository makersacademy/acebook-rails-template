# frozen_string_literal: true

class CommentLikesController < ApplicationController
  before_action :set_comment

  def create
    @comment.comment_likes.create
    redirect_to posts_url
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
