class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def sign_up_params
    params.require(:user).permit(:bio)
  end

end
 