class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(post_comment_params)
    flash[:danger] = "Comment Added. Making everything about you eh?"
    redirect_to posts_url
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "Comment deleted. What are you trying to hide?"
    redirect_to posts_path
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.editable? && @comment.user.id == current_user.id
      @comment.update(comment: params[:comment][:comment])
      flash[:danger] = "Comment updated. Stop changing your story!"
    else
      flash[:danger] = "Fuck off, this is not yours!"
    end
    redirect_to posts_url
  end

  def like
    @likeable = Comment.find(params[:id])
    like = Like.find_by({likeable: @likeable, user: current_user})
    if like
      like.destroy
      flash = "Like Removed!"
    else
      Like.create(likeable: Comment.find(params[:id]), user: current_user)
      flash = "Like Counted!"
    end
    respond_to do |format|
      format.html do
        flash[:danger] = flash
        redirect_to posts_url
      end
      format.js
    end
  end


  private

  def post_comment_params
    params.require(:comment).permit(:comment)
      .merge({post_id: params.require(:post_id), user_id: current_user.id})
  end

end
