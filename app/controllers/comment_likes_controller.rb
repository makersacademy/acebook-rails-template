class CommentLikesController < ApplicationController
  before_action :set_comment
  before_action :set_post

  def create
    @comment.comment_likes.create(comm_like_params)
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(@comment.post_id)
  end


  def set_comment
    @comment = Comment.find(params[:comment_id])
  end


  def comm_like_params
    params.permit(:post_id, :comment_id)
  end


end
