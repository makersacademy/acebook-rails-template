class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    redirect_to posts_url
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_url, notice: 'Your like has been deleted'
  end

  private
  def like_params
    params.permit(:user_id, :post_id)
  end
end
