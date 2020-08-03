class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @time = Time.new
    @posts = Post.all
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.message == post_params[:message]
      flash.now[:messages] = "Not possible. Message has not been changed"
      render :edit
    elsif Time.now - 10.minutes > @post.created_at
      redirect_to posts_url
    else
      @post.update_attributes(post_params)
      redirect_to posts_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

end
