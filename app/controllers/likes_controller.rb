# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = Like.create(like_params.merge(user: current_user))
    redirect_to root_path
  end

private
  def like_params
    params.require(:like).permit(:post_id)
  end
end
