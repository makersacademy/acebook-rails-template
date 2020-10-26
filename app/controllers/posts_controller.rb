class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless @post.user_id == current_user.id
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to posts_url
    end
  end


end
