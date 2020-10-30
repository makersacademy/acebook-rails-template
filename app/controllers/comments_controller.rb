class CommentsController < ApplicationController
  # def index
  #   @comment = Comment.new
  #   @comments = Comment.all
  # end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: posts_path
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_back fallback_location: posts_path
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.update(comment_params)
    redirect_to posts_url
  end

  def like
    @comment = Comment.find(params[:id])
    @comment.liked_by current_user
    redirect_back fallback_location: root_path
  end

  def unlike
    @comment = Comment.find(params[:id])
    @comment.unliked_by current_user
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id).merge(user_id: current_user.id)
  end
end
