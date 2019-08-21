class CommentsController < ApplicationController

  def create
     @post = Post.find(params[:post_id])
     @comment = @post.comments.create!(params.require(:comment).permit(:name,:comment))
     redirect_to post_url(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path
  end
end
