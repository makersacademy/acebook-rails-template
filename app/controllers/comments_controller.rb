# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: %i[show edit update destroy]
  before_action :owned_post, only: %i[edit update destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:success] = 'Comment successfully added'
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:success] = 'Comment updated'
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_url
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id).merge(user_id: current_user.id)
  end

  def owned_post
    unless @comment.user_id == current_user.id
      flash[:alert] = "That comment doesn't belong to you!"
      redirect_to posts_url
    end
  end
end
