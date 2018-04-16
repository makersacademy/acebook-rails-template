# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]

  def correct_user
    @comment = Comment.find(params[:id])
    redirect_to posts_path unless current_user.id == @comment.user_id
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(commenter: current_user.username, user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :comment_id, :user_id)
  end
end
