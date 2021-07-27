class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: comment_params, user: current_user)
    # //redirect_to post_path(params[:post_id])
  end

  def index 
    @post = Post.find(params[:post_id])
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def new 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: comment_params, user: current_user)
  end

  private
    def comment_params
      params.require(:comment).permit(:body) [:body]
    end
end
