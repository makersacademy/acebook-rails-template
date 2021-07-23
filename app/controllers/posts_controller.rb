class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # p render plain: params[:post].inspect
    p @post = Post.create(post_params)
    p "images"
    p @post.images.attach(params[:images])
    @post.save
    p params[:post][:images]
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def like
    
  end

  private

  def post_params
    params.require(:post).permit(:message, images: [])
  end
end
