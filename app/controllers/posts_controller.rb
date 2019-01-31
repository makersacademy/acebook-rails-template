class PostsController < ApplicationController

  # need to refactor as Post.find doesnt follow DRY
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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
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

end
