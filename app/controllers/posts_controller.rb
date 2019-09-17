class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to posts_url
  end

  def delete
    @post = Post.find(params[:format])
    @post.delete
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order("created_at DESC")
    @user = User.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:message))
      redirect_to posts_url
    end
  end

  private
    def post_params
      params.require(:post).permit(:message)
    end
end
