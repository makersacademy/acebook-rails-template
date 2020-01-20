class PostsController < ApplicationController

  before_action :require_login

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if above_10_mins_post
      redirect_to posts_path, flash: { error: "Unable to edit post over 10 mins after creation" }
    elsif @post.update(post_params)
      redirect_to posts_url, :notice => "Successfully edited the message"
    else
      render 'edit'
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, :notice => "Your post has been deleted"
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def above_10_mins_post
    Time.now.utc > (@post.created_at.utc + 10.minutes).utc
  end

end
