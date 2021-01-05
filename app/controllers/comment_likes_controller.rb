class CommentLikesController < ApplicationController
  before_action :find_comment

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

  def find_comment
    @commontator_comment = Commontator::Comment.find(params[:commontatorid])
  end

  def already_liked?
    CommentLike.where(user_id: current_user.id, commontator_comment_id: params[:commontator_comment_id]).exists?
  end

end
