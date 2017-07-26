class UsersController < ApplicationController
  def new
    @user = User.new
    render 'sign-up'
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_url
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render 'show'
    else
      @user = User.create(default_params)

      render 'show'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def default_params
    {name: "Default", email: "default@test.com", password: "Password123",
    password_confirmation: "Password123"}
  end
end
