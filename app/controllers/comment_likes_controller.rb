# frozen_string_literal: true

class CommentLikesController < ApplicationController
  before_action :set_comment
  before_action :set_post
  before_action :find_comment_like

  def create
    p "COMM LIKE:::: #{@comm_like}"

    if @comm_like
      p 'DESTROY'
      destroy
    else
      p 'CREATE'
      p "USER: #{params[:user_id]}"
      p "COMMENT: #{params[:comment_id]}"
      @comment.comment_likes.create(comm_like_params)
    end
    redirect_to post_path(@post)
  end

  def destroy
    @comment.comment_likes.where(comm_like_params).destroy(@comment.comment_likes.where(user_id: params[:user_id]).ids)
  end

  private

  def set_post
    @post = Post.find(@comment.post_id)
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def find_comment_like
    @comm_like = @comment.comment_likes.find_by(comm_like_params)
  end

  def comm_like_params
    params.permit(:comment_id, :user_id)
  end
end
