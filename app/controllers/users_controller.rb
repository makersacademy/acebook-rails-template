class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.all.order(created_at: :desc)
  end
end

