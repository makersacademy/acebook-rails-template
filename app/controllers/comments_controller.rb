class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :destroy

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to posts_url
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :content)
    end
end
