class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_url, alert: message(@post) unless current_user.id == @post.user_id && under_10_mins_elapsed(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  def update
    @post = Post.find(params[:id])
    redirect_to(posts_url) if @post.update(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def under_10_mins_elapsed(post)
    DateTime.now.to_i - post.created_at.to_i < 600
  end

  def message(post)
    if current_user.id != post.user_id
      "Unable to edit another user's posts"
    elsif !under_10_mins_elapsed(post)
      "Unable to edit post after 10 minutes"
    end
  end
end
