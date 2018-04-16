class LikesController < ApplicationController
  # before_action :authenticate_user!

  def create
    if post.likes.create(user: current_user)
      redirect_to post_redirect(post), :notice => 'Liked!'
    else
      redirect_to post_redirect(post), :alert => 'An error prevented you from liking this post!'
    end
  end

  def destroy
    post.likes.where(user: current_user).destroy_all
    redirect_to post_redirect(post), :notice => 'Unliked!'
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end
end
