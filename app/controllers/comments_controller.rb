class CommentsController < ApplicationController

  def create
    p "PARAM"
    p comment_params[:post]
    p comment_params

      @post = Post.find(4)
    @post.comments.create(message:comment_params[:message], user_id: current_user.id)

    redirect_to posts_url
  end


  private

  def comment_params
    params.require(:comment).permit(:message, :post)
  end
end
