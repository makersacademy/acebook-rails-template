class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:user).permit(:email,:password)
  end

end
