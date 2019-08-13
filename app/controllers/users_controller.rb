class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.password.length < 6 || @user.password.length > 10
      flash[:danger] = "Password needs to be between 6 - 10 characters"
      render 'new'
    else
      redirect_to posts_url

    end
  end
end

private

def user_params
  params.require(:user).permit(:username, :email, :password, :id)
end
