class CommentLikesController < ApplicationController

  # def new
  #   @post_like = PostLike.new
  # end

  def create
    @comment_like = CommentLike.create(comment_like_params)
    redirect_to posts_url
  end

  def destroy
    CommentLike.find_by(user: current_user, comment_id: params[:comment_id]).destroy
    redirect_to posts_url
  end

  private

  def comment_like_params
    params.permit(:comment_id).merge(user_id: current_user.id)
  end

end
