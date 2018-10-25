class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_url, notice: 'Your post has been updated'
    end
    # if @post.update_attributes(post_params)
    #   redirect_to posts_url, notice: 'Your post has been updated'
    # elsif @post.update_attributes(post_params).blank?
    #   render 'edit'
    # end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Your post has been deleted'
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
