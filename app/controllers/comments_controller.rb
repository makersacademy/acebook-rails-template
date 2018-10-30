class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :message)
  end
end
