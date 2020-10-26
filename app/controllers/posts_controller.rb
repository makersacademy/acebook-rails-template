class PostsController < ApplicationController
  respond_to :js, :html, :json
  before_action :authenticate_user!
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all
    @comment = Comment.new(post_id: params[:post_id])
  end

  def like
    @post = Post.find(params[:id])
<<<<<<< HEAD
    @post.liked_by current_user
=======
    @post.liked_by @post.user
>>>>>>> af27ad011d46a88bf75be767a4f79c4df1c7fc2c
    redirect_back fallback_location: root_path
  end

  def unlike
    @post = Post.find(params[:id])
<<<<<<< HEAD
    @post.unliked_by current_user
=======
    @post.unliked_by @post.user
>>>>>>> af27ad011d46a88bf75be767a4f79c4df1c7fc2c
    redirect_back fallback_location: root_path
  end

  private

  def post_params
    params.require(:post).permit(:message, :user_id).merge(user_id: current_user.id)
  end
end
