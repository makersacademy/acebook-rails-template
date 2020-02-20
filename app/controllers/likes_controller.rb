class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    redirect_to '/'
  end

  def destroy
    @like.destroy
    redirect_to '/'
  end

  def find_like
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
 end

  def liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

end
