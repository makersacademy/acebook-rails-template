class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # p render plain: params[:post].inspect
    @post = Post.create!(post_params)
    #p "images"
    #p @post.image.attach(params[:image])
    #@post.save
    #p params[:post][:image]
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def like
    
  end

  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
