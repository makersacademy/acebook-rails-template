class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      redirect_to posts_path, notice: "Yo, stop liking this"
    else
      @post.likes.create(user_id: current_user.id)
      redirect_to posts_path
    end
  end

  def destroy
    if already_liked?
      @like.destroy
      redirect_to posts_path
    else
      redirect_to posts_path, notice: "Can't unlike"
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
