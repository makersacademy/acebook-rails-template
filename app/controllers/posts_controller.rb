require_relative '../helpers/posts_helper.rb'
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
   #if ENV['RAILS_ENV'] == "test" && !@@test_user_id.nil?
    # session_user_id = @@test_user_id
   #else
  #session_user_id = session[:user]["id"]
   #end
    #session_user_id = session[:user]["id"]

    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.order("created_at Desc").all
    if session[:user]
      @user = session[:user]
    end
  end

  def like
    @post = Post.find_by(params[:id])
    @user = User.find_by(id: session[:user]["id"])
    @post.like(@user)
    redirect_to posts_url
  end

  private

  def post_params
    params.permit(:message, :user_id)
  end
end
