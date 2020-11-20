require_relative '../helpers/posts_helper.rb'
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if ENV['RAILS_ENV'] == "test"
      session_user_id = @@test_user_id
    else
      session_user_id = session[:user]["id"]
    end

    @post = Post.create(post_params.merge(user_id: session_user_id))
    redirect_to posts_url
  end

  def index
    @posts = Post.order("created_at Desc").all
    if session[:user]
      @user = session[:user]
    end
      
  end
  
  def comment
    @user = User.find_by(id: session[:user]["id"])
    @post = Post.find_by(id: params[:post_id])
    @post.comment(@user, params[:comment_text])
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
