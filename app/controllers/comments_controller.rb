class CommentsController < ApplicationController
  def new
    # @comment = Comment.new(post_id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(body: comment_params, post_id: params[:post_id], user_id: session[:user_id])
    redirect_to '/posts'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
