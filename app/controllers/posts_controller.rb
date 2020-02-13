class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    p @post.created_at
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    p "i am destroy"
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  private

  def time_format
    
  end

  def post_params
    params.require(:post).permit(:message)
  end
end
