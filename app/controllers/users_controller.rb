class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:profile]

  def profile
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id]).order("created_at DESC")
  end
end
