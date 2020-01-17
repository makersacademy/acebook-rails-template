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

    if Time.now.utc < (@post.created_at.utc + 10.minutes).utc
      if @post.update(post_params)
        redirect_to posts_url
      else
        render 'edit'
      end

    else
      redirect_to posts_path, flash: { error: "Unable to edit post over 10 mins after creation" }
    end

  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
