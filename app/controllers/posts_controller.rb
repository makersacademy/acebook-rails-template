class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # puts post_params['message'].encode('utf-8')
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    # redirect_to edit_post_url
  end

  def update
    a = params[:id]
    @post = Post.find_by(id: a)
    @post.update(post_params)
    redirect_to posts_url
  end

  def show
    a = params[:id]
    @post = Post.find_by(id: a)
    @post.destroy
    redirect_to posts_url
  end 

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
