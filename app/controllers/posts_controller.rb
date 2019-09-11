class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_url
  end

  def index
    ordered_posts = Post.order('created_at DESC')
    @posts = ordered_posts
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
    flash[:error] = "Calm down, you can only delete your own posts"
    redirect_to posts_url
    else
    @post.destroy
    redirect_to posts_url
  end
  end




  private

  def post_params
    # p params
    params.require(:post).permit(:message)
  end
end
