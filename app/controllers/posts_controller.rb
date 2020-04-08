class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create({
      poster_id: "1",
      content: params[:message],
      time: Time.now
  })
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:content))
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post successfully deleted'
    redirect_to posts_url
  end
end
