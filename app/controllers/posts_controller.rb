class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      redirect_to posts_url
    else
      redirect_to new_post_path(errors: @post.errors.messages)
    end

  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path, notice: 'Your post was deleted successfully'
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post.increment_views()
  end

  def like_post
    @current_user_id = current_user.id
    @post_id = params[:post_id]
    @post = Post.find(@post_id)
    user_not_liked_post = !(@post.liked_user_ids.include? @current_user_id)
    if user_not_liked_post
      @post.increment_likes @current_user_id
    end
    render 'like_post'
  end

  private

  def post_params
    params.require(:post).permit(:message, :title, :image)
  end
end
