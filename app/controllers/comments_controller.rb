class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.name = current_user.name

    @comment.save

    redirect_to post_path(@comment.post)
  end 

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to post_path(@post)
  # end

end
