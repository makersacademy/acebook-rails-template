class CommentsController < ApplicationController
  def create
    # @post= current_user.posts.create(post_params)
    # redirect_to @post

    find_post
    params = comment_params
    params[:user_id] = current_user.id
    @comment = @post.comments.create(params)
    redirect_to post_path(@post)
    # set comment.user_id to current_user
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
