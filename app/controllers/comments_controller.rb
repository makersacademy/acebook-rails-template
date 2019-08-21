# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post

  def create
    @user = User.find(session[:user_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @user.id

    if @comment.save
      flash[:success] = 'Well done for doing your little comment!'
      redirect_to posts_url
    else
      flash[:alert] = 'You got a baddie, try again'
      render posts_url
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @user = User.find(session[:user_id])

    if @comment.user_id == @user.id
      @comment.destroy

      redirect_to posts_url
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update

    @comment = @post.comments.find(params[:id])
    @user = User.find(session[:user_id])

    if @comment.user_id != @user.id
      redirect_to posts_url
    else
      @comment.update(comment_params)
      redirect_to users_url
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
