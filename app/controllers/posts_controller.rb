class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.create(post_params)
    redirect_back(fallback_location: root_path)
  end

  def index
    @post = current_user.posts.create
    @posts = Post.order(:id).reverse
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def edit
    @post = Post.find(params[:id])
    session[:prev_url] = request.referer
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to session[:prev_url], :notice => "Post has been updated"
    else
      render "edit"
    end
  end
  private

  def post_params
    params.require(:post).permit(:message, :image)
  end
end
