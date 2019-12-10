class PostsController < ApplicationController
  #force the user to redirect to the login page if the user was not logged in
  before_action :authenticate_user!

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def index
    @post = current_user.posts.new
    @user = current_user
    @username = current_user.username
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @username = current_user.username
    @user = current_user
    @posts = current_user.posts.all.order(created_at: 'DESC')
  end

  private

  def post_params
    params.require(:post).permit( :message, :username)
  end
end
