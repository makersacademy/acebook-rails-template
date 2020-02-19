class LikesController < ApplicationController
  skip_before_action :authenticated_user
  before_action :find_post

  def create
    if already_liked?
      flash.now.alert = "Apologies, you have already liked this"
      @posts = Post.order(created_at: :desc)
      render 'posts/index'
    else
    @post.likes.create(user_id: current_user.id)
    redirect_to session[:url]
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

end
