class PostsController < ApplicationController
 
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if (@post.save)
      redirect_to '/posts'
    else
      render 'new'
    end
  end
  
  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to root_url
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
