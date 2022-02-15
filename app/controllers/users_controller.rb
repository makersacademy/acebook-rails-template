class UsersController < ApplicationController
  # def show
  #   @posts = current_user.posts.order(created_at: :desc)
  # end

  def create
    User.create(user_params)
    redirect_to current_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
