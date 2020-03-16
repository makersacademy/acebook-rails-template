class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

<<<<<<< HEAD
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.update(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
=======
  def destroy 
    @post = Post.find(params[:id])
    if @post.user_id === current_user.id
      @post.destroy
    else 
      flash[:alert] = "Error: can't delete posts by other users"
    end 
    redirect_to posts_path

>>>>>>> master
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end
