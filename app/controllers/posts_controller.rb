class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.reverse
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(edit_params)
      redirect_to posts_url
    else
      render 'edit'
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

  def edit_params
    params.require(:post).permit(:message)
  end

end
