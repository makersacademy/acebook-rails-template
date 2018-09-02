# frozen_string_literal: true

# Add this line in every controller where we wish to restrict view to only signed in users
# before_filter :authorize

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc).all
    @users = User.all
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
