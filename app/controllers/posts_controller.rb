class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end 

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit 
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else 
      render :edit
    end 
  end



  private

  def post_params
    params.require(:post).permit(:message)
  end
end
