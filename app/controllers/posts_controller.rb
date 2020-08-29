class PostsController < ApplicationController
  before_action :require_login

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: post_params['message'], user: User.find(current_user.id))
    @user_post = UsersPost.create(post_id: @post.id, user_id: current_user.id)
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
