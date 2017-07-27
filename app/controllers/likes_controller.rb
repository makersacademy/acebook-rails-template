class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    redirect_to posts_url
  end
end
