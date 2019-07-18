class PostsController < ApplicationController

  def show
    @post = post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end


  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
