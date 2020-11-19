class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create(session_user_id = session[:user]["id"])
    @post = Post.create(post_params.merge(user_id: session_user_id))
    redirect_to posts_url
  end

  def index
    @posts = Post.order("created_at Desc").all
    if session[:user]
      @user = session[:user]
    end
      
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
