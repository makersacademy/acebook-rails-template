class PostsController < ApplicationController
  # def new
  #   @post = Post.new
  # end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    redirect_to pages_home_url if current_customer == nil
    @posts = Post.all.reverse
  end

  private

  def post_params
    params[:post][:customer_id] = current_customer.id unless current_customer == nil
    params.require(:post).permit(:message, :customer_id)
  end
end
