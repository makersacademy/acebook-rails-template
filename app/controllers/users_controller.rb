class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    # @profile_posts = ProfilePost.find.order("created_at DESC")
    @profile_posts = ProfilePost.where(user_profile_id: params[:id]).order("created_at DESC")
    p @profile_posts
  end



end
