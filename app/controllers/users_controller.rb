class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    begin User.friendly.find(params[:id]).present?
      @user = User.friendly.find(params[:id])
      @posts = @user.posts.order("created_at DESC")
      # @profile_posts = ProfilePost.find.order("created_at DESC")
      @profile_posts = ProfilePost.where(user_profile_id: params[:id]).order("created_at DESC")

  #    p @profile_posts
    rescue
      render file: "#{Rails.root}/app/views/errors/404", status: :not_found
    end
  end
end
