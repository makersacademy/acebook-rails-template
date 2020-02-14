class PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts.reverse
  end

  def posts_all
    @posts = Post.all.reverse
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:post_content)
    post_params[:user_id] = session[:user]['id']
    @post = Post.new(post_params)
    @post.save
    redirect_to user_posts_path(session[:user]['id'])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(session[:user]['id'])
  end

end
