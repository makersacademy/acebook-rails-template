class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,:password))
    # uncomment line below to keep log in new user when signed up
    # session[:user_id] = @user.id
    # decide which page the newly signed up user is
    # redirected to when signed up and logged in
    redirect_to '/welcome'
  end
end
