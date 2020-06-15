class PostLikesController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:id])
    @post_like = PostLike.create(user_id: @user.id, post_id: @post.id)
    redirect_to posts_url
  end

  def destroy
    @user = current_user
    @post = Post.find(params[:id])
    @post_like = PostLike.find_by(user_id: @user.id, post_id: @post.id)
    @post_like.destroy
    redirect_to posts_url
  end
end
