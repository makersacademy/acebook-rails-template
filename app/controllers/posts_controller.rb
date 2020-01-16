class PostsController < ApplicationController
  # before_action :owned_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
    owned_post(@post)
  end

  def update
    @post = Post.find(params[:id])
    redirect_to posts_url if @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    owned_post(@post)
    @post.destroy
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def owned_post(post)
    unless current_user.id == post.user_id
      flash[:alert] = "That post doesn't belong to you"
      redirect_to posts_url
    end
  end

end
