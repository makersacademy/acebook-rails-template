class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def edit
    @post = Post.find_by(id: params[:id])
    validate_owner
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update(message: params[:post])
    redirect_to posts_url
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    validate_owner
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def validate_owner
    redirect_to posts_url, notice: "Oops, that's not your post!" if current_user.id != @post.user_id
  end
end
