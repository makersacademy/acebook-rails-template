class CommentsController < ApplicationController

  def index
  @comment = Comment.all
end

def new
  @comment = Comment.new
end

def create
  @current_post = Post.find(params[:post_id])
  @comment = @current_post.comments.create(commentParams) do |comment|
    comment.user = current_user
  end
  if @comment.save
    flash[:notice] = "Comment successfully added"
    redirect_to posts_url
  else
    flash[:notice] = "Your comment could not be added"
    redirect_to posts_url
  end
end

def show
  @comment = Comment.find(params[:id])
end

private

  def commentParams
    params.require(:comment).permit(:body)
  end

end
