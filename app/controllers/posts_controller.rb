class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to(posts_url)
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
