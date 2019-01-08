class UsersController < ApplicationController
  
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where creator_id: @user.id
    @post = Post.new
  end




end
