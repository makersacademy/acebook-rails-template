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

  def destroy
    p @post = Post.find(params[:id])
    @post.destroy  if current_user.id == @post.user_id  
    redirect_to posts_path(@post)
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    permitted_columns = params.require(:post).permit(:message, :user_id)
    @post.update_attributes(permitted_columns)
    redirect_to posts_path(@post)
  end




  private

  def post_params
    params.require(:post).permit(:message, :user_id, :created_at)
  end
end
