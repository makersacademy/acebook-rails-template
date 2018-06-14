class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.create_activity :create, owner: current_user if @comment.save
    redirect_to posts_url
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
