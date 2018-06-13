class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order(:id).reverse
  end

  def index
    @users = User.all
  end
end
