class PostsController < ApplicationController

  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.sort_by(&:created_at).reverse
    @users = User.all
    respond_to :js, :html, :json
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def like
    @post = Post.find(params[:id])

    if current_user.liked? @post
      @post.unliked_by current_user
    else
      @post.liked_by current_user
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
