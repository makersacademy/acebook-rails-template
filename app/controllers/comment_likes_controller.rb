class CommentLikesController < ApplicationController

  def create
    @comment.likes.create(comm_like_params)
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def comm_like_params
    params.permit(:comment_id, :id)
  end


end
