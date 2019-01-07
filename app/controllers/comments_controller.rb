class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(commenter_id: current_user.id))
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:notice] = "Comment can not be empty, please enter information."
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
    # redirect_to root_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
