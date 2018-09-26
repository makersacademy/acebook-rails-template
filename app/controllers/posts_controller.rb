class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
    # @posts = Post.all.order("created_at DESC")
    # render 'index'
  end

  def update
    find_post

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
    find_post
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    find_post
  end
  
  def destroy
    find_post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
