class CommentLikesController < ApplicationController
  before_action :set_comment_like, only: [:show, :edit, :update, :destroy]

  def create
    if current_user != nil
      if already_liked?
        @commentlike = CommentLike.find_by(user_id: current_user.id, commontator_comment_id: params[:commontator_comment_id])
        @commentlike.destroy
      else
        @commontator_comment.likes.create(user_id: current_user.id)
      end
      redirect_to posts_url
    end
  end

  private

  def find_post
    @commontator_comment = commontator_comment.find(params[:commontator_comment_id])
  end

  def already_liked?
    CommentLike.where(user_id: current_user.id, commontator_comment_id: params[:commontator_comment_id]).exists?
  end

end
