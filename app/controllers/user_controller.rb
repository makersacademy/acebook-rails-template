class UserController < ApplicationController
  def index
    @posts = current_user.posts.order("created_at DESC")
    @user = User.find(params[:id])
  end

end
