class PostsController < ApplicationController
  before_action :post_owner, only: [:edit, :update, :destroy]
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def post_owner
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this Post'
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
