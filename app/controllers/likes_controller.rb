class LikesController < ApplicationController
  before_action :find_post

  def create
    if already_liked?
      flash[:liked] = 'You have already liked this post'
    else
      @post.likes.create(user_id:  session[:user_id])
    end

    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: session[:user_id], post_id: params[:post_id]).exists?
  end

end
