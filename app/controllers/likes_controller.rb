class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like_data = like_params.merge(user: current_user)
    @like = Like.create(@like_data)
    redirect_to root_path
  end

private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
