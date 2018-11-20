class UsersController < ApplicationController

  skip_before_action :require_login

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      redirect_to posts_url
    else
      flash.now[:danger] = "Password must be 6-10 characters long"
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
