class UsersController < ApplicationController

  before_action :signed_in, only: [:profile]

  #users_controller.rb
  def profile
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    p @posts 
  end

  private

  def signed_in 
    redirect_to new_session_path(User) if !user_signed_in?
  end

end
