class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if liked?
      flash[:notice] = "You can only like posts once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to posts_url
  end

  def liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

end
