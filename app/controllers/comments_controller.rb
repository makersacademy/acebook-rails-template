class CommentsController < ApplicationController
  def create
    @comment = Comment.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:comment).permit(:content)
  end
end
