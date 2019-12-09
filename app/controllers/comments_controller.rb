class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    p @comment
    # p params[:post_id]
  end

  def create
    # p params[:post_id]
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :body)
    end
end
