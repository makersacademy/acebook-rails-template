class LikesController < ApplicationController
  skip_before_action :authenticated_user
  before_action :find_post

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to session[:url]
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

end
