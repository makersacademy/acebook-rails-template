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
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
