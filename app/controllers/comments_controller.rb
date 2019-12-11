class CommentsController < ApplicationController

  def create

    @post = Post.find(comment_params[:post_id])
    @post.comments.create(message:comment_params[:message], user_id: current_user.id)
    redirect_to posts_url
  end


  private

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end
end
