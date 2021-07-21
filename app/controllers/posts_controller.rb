class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save!
    redirect_to '/posts'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path
      else
        render :edit
      end
    end
  
  



  private

  def post_params
    params.require(:post).permit(:message)
  end
end
