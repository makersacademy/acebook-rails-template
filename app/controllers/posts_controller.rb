class PostsController < ApplicationController

  def new
    @user = User.new(first_name:"Dave", last_name:"Jones", email:"dave@dave.com", password:"Dave")
    session[:user_id] = @user.save
  end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(posts_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

private

  def posts_params
    params.require(:post).permit(:message)
  end


end
