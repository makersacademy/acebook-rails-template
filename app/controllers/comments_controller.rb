class CommentsController < ApplicationController

  def create
    @posts = Post.find(params[:post_id])
    @comment = @posts.comments.create(comment_params)
    redirect_to post_path(@posts)
  end

  def destroy
    @posts = Post.find(params[:post_id])
    @comment = @posts.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@posts)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
