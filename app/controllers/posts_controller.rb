class PostsController < ApplicationController
  before_action :require_login

  def new
    session[:return_to] = request.referer
  end

  def create
    message = post_params["message"]
    user_id = current_user.id
    p params
    wall_id = User.find(params[:user_id]).wall.id
    @post = Post.create(message: message, user_id: user_id, wall_id: wall_id)
    # redirect_to posts_url
    redirect_to session.delete(:return_to)
  end

  def index
    @user = User.find(current_user.id)
    @posts = @user.posts
  end

  def edit
    session[:return_to] = request.referer
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    # redirect_to posts_path
    redirect_to session.delete(:return_to)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
