class LikesController < ApplicationController
  before_action :find_post

  def create
    if !(already_liked?)
      @post.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: posts_url)
  end

  def destroy
    if already_liked?
      find_like
      Like.delete(@like)
    end
    redirect_back(fallback_location: posts_url)
  end

  private

    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_like
      @like = @post.likes.find(params[:id])
    end

    def already_liked?
      Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
end
