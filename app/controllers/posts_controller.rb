class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html, :json


  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = current_user.posts.order(created_at: :desc)
  end

  def newsfeed
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def edit
  end

  def update
  @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def like
    @post = Post.find(params[:id])
    if params[:format] == 'like'
      @post.liked_by current_user
    elsif params[:format] == 'unlike'
      @post.unliked_by current_user
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :message, :user_id)
  end
end
