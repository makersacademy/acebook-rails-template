class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    p @post
    @comment = @post.comments.create(comment_params)
    p 'We have created a comment'
    p @comment
    p comment_params
    p current_user.id
    p @comment.user_id
    @comment.user_id = current_user.id
    p 'We have reset user_id'
    p @comment.user_id
    p 'We have saved user_id in the database'
    @comment.save
    p @comment.user_id
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
