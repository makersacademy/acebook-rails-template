class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(body: comment_params, user: current_user)
    redirect_to posts_path
  end

  def index 
    @post = Post.find(params[:post_id])
  end

  private
    def comment_params
      params.require(:comment).permit(:body) [:body]
    end
end
