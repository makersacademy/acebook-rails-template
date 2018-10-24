class LikesController < ApplicationController
  before_action :find_posts

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to posts_url
  end

  private 

  def find_posts
    @post = Post.find(params[:post_id])
  end
end
