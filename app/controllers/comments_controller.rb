# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_url
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
