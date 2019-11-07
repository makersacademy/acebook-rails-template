class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:profile]

  #users_controller.rb
  def profile
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id]).order("created_at DESC")
  end

end
