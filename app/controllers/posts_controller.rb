class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    # add check for post time
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end 
  
  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def update_post_params
    params.require(:post).permit(:message)
  end
end
