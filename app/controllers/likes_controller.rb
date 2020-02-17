class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    redirect_to posts_url
  end

end
