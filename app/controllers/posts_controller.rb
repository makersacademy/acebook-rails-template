class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    
    redirect_to posts_url
  end

  # def index
  #   @posts = Post.all.order(created_at: :desc)
  #   @post = @posts[0];
  # end

  def index
      @posts = Post.where(user_id: session[:user_id]).order(created_at: :desc)
  end

  def update
    if params[:delete_button]
      destroy
    elsif params[:like_button]
      like
    else
      @post = Post.find(params[:id])
      @post.update(post_params)

      redirect_to posts_url
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  def like
    @post = Post.find(params[:id])
    count = @post.likes
    @post.update(:likes => (count + 1))

    redirect_to posts_url
  end
  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end
end
