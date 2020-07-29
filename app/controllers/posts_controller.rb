class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = nil
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
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == 1
    @post.destroy
    redirect_to posts_path
    else
    @post.errors = "Cannot delete other user's posts"
    end

  end

  private
  def post_params
    params.require(:post).permit(:message)
  end
end
