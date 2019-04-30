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
    @post = Post.delete(params[:id])
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
