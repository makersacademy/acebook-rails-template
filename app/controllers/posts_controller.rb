class PostsController < ApplicationController
  def index
    p session[:user_id]
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if !@post.editable?
      redirect_to posts_url
      flash[:danger] = 'This post is no longer editable'
    end
  end

  def create
    @post = Post.create(message: post_params["message"], user_id: session[:user_id])
    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  private

  def post_params
    params.require(:post).permit(:message)
  end
end
