class PostLikesController < ApplicationController

  def new
    @post_like = PostLike.new
  end

  def create
    @post_like = PostLike.create(post_like_params)
    redirect_to posts_url
  end

  def destroy
    PostLike.find_by(user: current_user, post_id: params[:post_id]).destroy
    redirect_to posts_url
  end

  private

  def post_like_params
    params.permit(:post_id).merge(user_id: current_user.id)
  end

end
