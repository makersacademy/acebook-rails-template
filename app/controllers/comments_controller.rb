# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :post_find, except: [:upvote]

  def create
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_url
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    @comment.update(body: params[:body])
    redirect_to posts_url
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def post_find
    @post = Post.find(params[:post_id])
  end
end
