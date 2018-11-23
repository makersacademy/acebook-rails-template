class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    flash[:notice] = 'Successfully commented!'
    redirect_to user_post_path(user_id: @user.id, id: @post.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted!'
    redirect_to user_post_path(user_id: @user.id, id: @post.id)
  end

  private

  def comment_params
    user_id_hash = params.permit(:user_id)
    body_hash = params.require(:comment).permit(:body)
    user_id_hash.merge(body_hash)
  end
end
