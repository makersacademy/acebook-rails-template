class UsersController < ApplicationController
  def show
    begin
      @user = User.friendly.find(params[:id])
      @posts = @user.posts.reverse
    rescue
      user_not_found
    end
  end

  def user_not_found
    render file: Rails.public_path.join('user_not_found'), layout: true, status: :not_found
  end

  # def current_profile
  #   redirect_to user_path(current_user)
  # end
end
