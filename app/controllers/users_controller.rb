class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def user_params
    params.require(:user).permit(:email, :password, :bio, :image)
  end

  def index
  end

  def update_profile
    current_user.update(bio: user_params[:bio])
    current_user.update(picture: user_params[:image])
    redirect_to user_path(current_user)
  end

end
 