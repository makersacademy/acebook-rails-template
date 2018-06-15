class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
