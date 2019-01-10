class LikeCommentController < ApplicationController
  before_action :find_comment
  def like_comment
  end

  def create
    @post.comments.likes.create(user_id: current_user.id)
    # redirect_to post_path(@post)
  end

  private
  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

end
