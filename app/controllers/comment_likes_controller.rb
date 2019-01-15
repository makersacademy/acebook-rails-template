class CommentLikesController < ApplicationController
  def new
    @user = current_user
    @comment = Comment.find(params[:id])
    @comment_like = CommentLike.create(
      user_id: @user.id,
      comment_id: @comment.id
    )
    redirect_to posts_url
  end

  def destroy
    @user = current_user
    @comment = Comment.find(params[:id])
    @comment_like = CommentLike.find_by(
      user_id: @user.id,
      comment_id: @comment.id
    )
    @comment_like.destroy
    redirect_to posts_url
  end
end
