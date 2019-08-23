# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post

  def create
    @user = User.find(session[:user_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @user.id

    if @comment.save
      redirect_back fallback_location: "www.bbc.co.uk"
    else
      redirect_back fallback_location: "www.bbc.co.uk"
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @user = User.find(session[:user_id])

    if @comment.user_id == @user.id
      @comment.destroy
      redirect_back fallback_location: "www.bbc.co.uk"
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    @user = User.find(session[:user_id])

    if @comment.user_id != @user.id
      redirect_back fallback_location: "www.bbc.co.uk"
    else
      @comment.update(comment_params)
      redirect_back fallback_location: "www.bbc.co.uk"
    end
    redirect_back fallback_location: "www.bbc.co.uk"
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
