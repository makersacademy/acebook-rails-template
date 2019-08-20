class PostsController < ApplicationController

  respond_to :html, :json
  protect_from_forgery

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to posts_url
      else
        render 'new'
      end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    respond_with @post
  end

  def index
    if logged_in?
      @posts = Post.all
    else
      redirect_to sessions_new_url
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def show
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
