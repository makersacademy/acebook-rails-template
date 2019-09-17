# frozen_string_literal: true

class UsersController < Clearance::UsersController
  def wall
    @posts = current_user.posts.all
    @albums = %w[1 2 3]
    
  end

  def update
    p params
    current_user.avatar.attach(params[:user][:avatar])
     redirect_to root_url
  end

  def show
    @posts = Posts.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end
end
