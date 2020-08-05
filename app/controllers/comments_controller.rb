class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    p @post
    @comment = @post.comments.create(comment_params)
    p @comment
    p comment_params
    p current_user.id
    p @comment.post_id
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
