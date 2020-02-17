class PostsController < ApplicationController
  def index
    @user = User.find(session[:user]['id'])
  end

  def new
    @user = User.find(session[:user]['id'])
  end

  def create
    post_params = params.require(:post).permit(:post_content)
    post_params[:user_id] = session[:user]['id']
    @post = User.find(session[:user]['id']).posts.create(post_params)
    @post.save
    redirect_to user_posts_path(session[:user]['id'])
  end

  def destroy
    @post = User.find(session[:user]['id']).posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(session[:user]['id'])
  end
end
