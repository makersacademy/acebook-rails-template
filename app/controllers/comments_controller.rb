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
    redirect_to '/'
  end

  private

  def comment_params
    user_id_hash = params.permit(:user_id)
    body_hash = params.require(:comment).permit(:body)
    user_id_hash.merge(body_hash)
  end
end
