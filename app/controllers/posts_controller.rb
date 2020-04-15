class PostsController < ApplicationController

  def index
    @user = User.find(session[:current_user])
    @posts = Post.all
    @comments = Comment.all
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
      poster_id: session[:current_user],
      content: params[:message],
      time: Time.now
  })
    redirect_to '/home'
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:content))
    redirect_to '/home'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post successfully deleted'
    redirect_to '/home'
  end
  
end
