class UsersController < ApplicationController
  def new
    @user = User.new
    render 'sign-up'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_url
    else
      redirect_to new_user_url
    end
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
