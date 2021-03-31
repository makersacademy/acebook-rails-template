class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    elsif @post.id == nil
      flash[:notice] = "You can't like a non-post"
    else
      @post.likes.create(user_id: current_user.id)
      redirect_to posts_url
    end
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
      redirect_to posts_url
    end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = Like.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

end
