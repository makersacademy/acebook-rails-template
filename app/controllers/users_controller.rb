class UsersController < ApplicationController
  def index
    check_for_user
    @users = User.all
  end

  def show
    check_for_user
    @user = User.find_by(id: session[:user]['id'])
  end

  def new
    session[:user] = nil
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    session[:user] = @user
    if @user.save
      redirect_to posts_url
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def check_for_user
      if session[:user] === nil
        redirect_to new_user_url
      end
    end
end
