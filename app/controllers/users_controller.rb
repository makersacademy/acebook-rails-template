class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @users = User.create(post_params)
    redirect_to posts_url
  end

  def index
    @users = User.all
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
