class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    params[:post][:user_id] = current_user.id
    @post = Post.create(post_params)
    redirect_to posts_url
    p current_user
    p params[:post][:user_id]
  end

  def index
    @posts = Post.all.sort_by(&:created_at).reverse
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
