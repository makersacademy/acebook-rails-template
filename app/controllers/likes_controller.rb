class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.liked_by current_user # find at some point how to find the post for the current user
    redirect_to user_posts_path(current_user)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.disliked_by @post.user # find at some point how to find the post for the current user
    redirect_to user_posts_path(@post.user)
  end

end
