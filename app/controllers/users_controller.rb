class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @posts = @user.posts.reverse
    @wallposts = @user.wall_posts.reverse
  rescue ActiveRecord::RecordNotFound
    user_not_found
  end

  def user_not_found
    render file: Rails.public_path.join('user_not_found'), layout: true, status: :not_found
  end
end
