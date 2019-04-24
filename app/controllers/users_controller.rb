class UsersController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
=======
  protect_from_forgery

>>>>>>> 8b2bd6f9973a976f4042053c7c04f0c009a8cdb8
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_url
  end

  def index
    @users = User.all
  end


private

  def user_params
    params.require(:user).require(:email).require(:password)
  end
<<<<<<< HEAD
=======
  protect_from_forgery

  def create
    redirect_to posts_url
  end
end
>>>>>>> d1a152c5621af5bdab6d7c4f854e17bb4fd9c7dc
=======
end
>>>>>>> 8b2bd6f9973a976f4042053c7c04f0c009a8cdb8
