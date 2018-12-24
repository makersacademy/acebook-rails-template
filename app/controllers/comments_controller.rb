class CommentsController < ApplicationController

  def create
    @post = Post.find(params['post_id'])
    @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to posts_path("/")
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

end
