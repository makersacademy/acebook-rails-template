class CommentsController < ApplicationController
  def create
    # @post= current_user.posts.create(post_params)
    # redirect_to @post

    find_post
    @comment = @post.comments.create(comment_params)
    # set comment.user_id to current_user
  end

  private
  def find_post
  end

  def comment_params
    params.require(:comment).permit(:body)
  end


end
