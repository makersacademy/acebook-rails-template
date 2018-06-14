class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    redirect_to posts_url
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
