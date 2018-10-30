class UsersController < ApplicationController
  def show
    if User.find_by_id(params[:id])
      @user = User.find(params[:id])
      @posts = @user.posts.reverse
    else
      user_not_found
    end
  end

  def user_not_found
    render file: Rails.public_path.join('user_not_found'), layout: true, status: :not_found
  end

  def current_profile
    redirect_to user_path(current_user)
  end
end
