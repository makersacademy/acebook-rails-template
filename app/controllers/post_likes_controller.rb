class PostLikesController < ApplicationController

  def new
    @post_like = PostLike.new
  end

  def create
    @post_like = PostLike.create(post_like_params)
  end

  def destroy
    PostLike.find_by(user: current_user, post_id: params[:id]).destroy
  end

  private

  def post_like_params
    # params.permit might override params.require
    params.require(:post_id).merge(user_id: current_user.id)
  end

end
