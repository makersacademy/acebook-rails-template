class PostsController < ApplicationController

  before_action :set_post, only: [:like, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    params.inspect
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order_by_created_at
    # @posts = Post.all.order("created_at DESC")
  end

  def like
    @post.likes += 1
    @post.save!
    redirect_to '/posts'
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.inspect
    params.require(:post).permit(:message, :image)
  end
end
