# frozen_string_literal: true

class UsersController < Clearance::UsersController

  def show
    @posts = current_user.posts.all
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
