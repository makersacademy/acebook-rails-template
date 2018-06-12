class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = current_user.posts.create
    @posts = Post.order(:id).reverse
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
    if @post.update_attributes(post_params)
      redirect_to posts_url, :notice => "Post has been updated"
    else
      render "edit"
    end
  end
  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
