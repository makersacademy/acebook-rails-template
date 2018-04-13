class CommentsController < ApplicationController
  before_action :find_post

def create
  @comment = @post.comments.create(params[:comment].permit(:user, :body))
  @comment.save
  redirect_to post_path(@post)
end

private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
