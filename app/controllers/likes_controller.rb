class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]
  respond_to :js, :html, :json

  def create
    if already_liked?
      render json: {error_message: "Yo, stop liking this"}
    else
      @post.likes.create(user_id: current_user.id)
      render json: {like_count: @post.likes.count, post_id: @post.id, user_like: @post.likes.find { |like| like.user_id == current_user.id}}
    end
  end

  def destroy
    if already_liked?
      @like.destroy
      render json: {like_count: @post.likes.count, post_id: @post.id}
    else
      render json: {error_message: "Can't unlike"}
    end
  end

    private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.exists?(user_id: current_user.id, post_id: params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
