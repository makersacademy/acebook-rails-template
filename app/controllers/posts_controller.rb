class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:message))
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def ten_minutes_difference(updated_at)
    @post = Post.find(params[:id])
    return Time.now - updated_at
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
