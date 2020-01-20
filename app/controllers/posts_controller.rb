class PostsController < ApplicationController

  before_action :redirect_to_index_if_not_signed_in

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.save ? (redirect_to posts_url) : (render 'new')
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def index
    @user = current_user
    @posts = Post.all
    @comment = Comment.new
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params) ? (redirect_to posts_url) : (render 'edit')
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
