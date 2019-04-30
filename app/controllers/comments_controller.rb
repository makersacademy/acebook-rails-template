class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(body: comment_params["body"], user_id: current_user.id)
    flash[:notice] = "Salmon had to say it!"
    redirect_to posts_url
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
