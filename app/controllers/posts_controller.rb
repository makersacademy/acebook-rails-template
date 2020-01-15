class PostsController < ApplicationController
  
  before_action :redirect_to_index_if_not_signed_in

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    p params[:id]
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def update
    Post.update(params[:id], :message => params[:post_message])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
