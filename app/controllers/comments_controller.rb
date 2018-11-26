# frozen_string_literal: true

# This is a comments controller
class CommentsController < ApplicationController
  def new
    # @comment = Comment.new(post_id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(body: comment_params[:body],
                              post_id: params[:post_id],
                              user_id: session[:user_id])
    redirect_to '/posts'
  end

  def edit
    @comment = Comment.find(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
