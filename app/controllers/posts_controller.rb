class PostsController < ApplicationController
  before_action :require_login

  def show
  end

  def new
    @post = Post.new
  end

  def create
    p "/1"
    p post_params
    p "/2"
    p params
    p "/3"
    p params[:user_id]
    p "/4"
    p params[:id]
    p "/5"
    p session[:id]
    p "/6"
    p session[:user_id]
    p "/7"
    p current_user
    p "/8"
    p @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  private

  def post_params
    params.fetch(:post, {}).permit(:message)
  end
end
