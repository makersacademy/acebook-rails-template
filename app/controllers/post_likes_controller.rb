class PostLikesController < ApplicationController

  def new
    @user = current_user
    @post = Post.find(params[:id])
    @post_like = PostLike.create(user_id: @user.id, post_id: @post.id)
    redirect_to posts_url
  end

end
