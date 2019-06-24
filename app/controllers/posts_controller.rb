class PostsController < ApplicationController
  before_action :can_edit, only: [ :edit, :update, :destroy ]
  before_action :check_time!, only: [:edit, :update]

  def index
    @posts = Post.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: session[:user_id]))
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def can_edit
    @post = Post.find(params[:id])
    unless @post and current_user and current_user.can_edit? @post
      redirect_to posts_url
    end
  end

  def check_time!
    if Time.now() > @post.created_at + 10.minutes
      flash[:created_at] = "Post can only be edited 10 min after it has been created"
      redirect_to posts_url
    end
  end

end
