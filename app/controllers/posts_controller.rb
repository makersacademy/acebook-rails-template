class PostsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create, :index]
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: params["post"]["message"], users_id: @current_user.id)
    redirect_to posts_url
  end

  def index
    # @current_user = session[:users_id]
    @posts = Post.order(created_at: :desc)
  end
end
