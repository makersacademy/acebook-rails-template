class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse_order
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update 
    #raise params.inspect
    @post = Post.find(params[:id])
    @post.update(message: params[:post][:message])
    redirect_to posts_path(@post)
  end


  private

  def post_params
    params.require(:post).permit(:message)
  end
end
