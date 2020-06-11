class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def update
    @post = Post.find(params[:id])
    @posts = Post.all
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  private

  def post_params
    params.require(:post).permit(:message)
  end
end
