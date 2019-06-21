class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user] = @user
    if @user.save
      redirect_to posts_url
    else
      flash[:error] = "Email address already taken"
      redirect_to users_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
