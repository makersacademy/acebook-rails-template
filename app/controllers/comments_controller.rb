class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to user_posts_path
    else
      flash.now[:danger] = "error"
    end
  end

  def new
    @comment = Comment.new
  end

  private

    def comment_params
    params.require(:comment).permit(:comment)
    end
end

