class UsersController < ApplicationController
<<<<<<< HEAD
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def index
    @users = User.all
  end
end

private

  def user_params
    params.require(:user).require(:email).require(:password)
  end
=======
  protect_from_forgery

  def create
    redirect_to posts_url
  end
end
>>>>>>> d1a152c5621af5bdab6d7c4f854e17bb4fd9c7dc
