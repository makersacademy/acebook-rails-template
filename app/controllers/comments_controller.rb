class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(body: params[:comment][:body], user_id: current_user.id)
    redirect_to posts_url
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
