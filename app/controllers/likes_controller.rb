class LikesController < ApplicationController
  before_action :find_post
  def create
    unless @post.likes.create(user_id: current_user.id)
      redirect_to post_path(@post)
    else
      redirect_to URI(request.referer).path
    end
  end
  private
  def find_post
    @post = Post.find(params[:post_id])
  end
end
