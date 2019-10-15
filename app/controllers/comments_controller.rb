class CommentsController < ApplicationController

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: comment_params["body"], user_id: session[:user_id], post_id: comment_params["post_id"])
    redirect_to post_path(@post)
  end

private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end

end
