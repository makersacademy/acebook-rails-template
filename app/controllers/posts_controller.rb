class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :destroy]

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :message, :user_id)
  end
end
