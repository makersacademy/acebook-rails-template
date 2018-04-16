class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!

  def create
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params[:comment].permit(:content).merge(user_id: current_user.id)
  end

end
