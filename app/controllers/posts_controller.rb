class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to posts_url
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(params[:post].permit(:message))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
