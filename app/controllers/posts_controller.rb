class PostsController < ApplicationController
  before_action :authenticate_user, :only => [:new, :create, :index]
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(message: params["post"]["message"], users_id: @current_user.id)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_url
    else
      render "edit"
    end
  end
   
  def index
    # @current_user = session[:users_id]
    @posts = Post.order(created_at: :desc)
  end

  private 

  def post_params
    params[:post].permit(:message, :users_id)
  end
end
