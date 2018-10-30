class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.reverse
  end
  def current_profile
    redirect_to user_path(current_user)
  end
end
