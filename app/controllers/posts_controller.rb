class PostsController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    @post = Post.create(post_params)
    redirect_to "/"
  end

  def show
    @user = User.find(session[:current_user_id])
    @post = Post.find(params[:id])
  end

  # def index
  #   @user = User.find(session[:current_user_id])
  #   @posts = Post.where(user_id: @user.id)
  # end

  def destroy
    @user = User.find(session[:current_user_id])
    @post = Post.find(params[:id])
    if @post.likes.empty?
      @post.destroy
    else
      @likes = Like.find_by(post_id: @post.id)
      @likes.destroy
      @post.destroy
    end
    post_delete_notice
    redirect_back fallback_location: request.referrer
  end

  def update
    @user = User.find(session[:current_user_id])
    @post = Post.find(params[:id])
    @post.update(post_params)
    post_update_notice
    redirect_to '/'
  end

  private

  def post_params
    { user_id: params[:user_id], message: params[:message] }
  end

  def post_delete_notice
    flash[:notice] = "Your post has been deleted"
  end

  def post_update_notice
    flash[:notice] = "Your post has been updated"
  end

end
