class LikesController < ApplicationController

  before_action :find_post

  def create
    if !liked?
      @post.likes.create(user_id: current_user.id)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = @post.likes.find(params[:id])
    if liked?
      @like.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end
