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
    p ENV['RAILS_ENV']
    @posts = Post.all.sort_by(&:created_at).reverse
    @users = User.all
  end

  def show
    # @posts = current_user.posts
    # ^^ promising way to show one user's posts
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

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
