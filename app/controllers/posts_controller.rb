class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create( {message: post_params , user_id: current_user.id} )
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    @current_post = Post.find(params[:id])
    if @current_user.id == @current_post.user_id
      @post = Post.delete(params[:id])
    end
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.message  = post_params
    @post.save
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).require(:message)
  end
end
