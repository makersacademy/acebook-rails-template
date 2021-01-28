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
    @user = User.new(user_params)
    p "3"
    p @user

    if @user.save
      session[:user] = @user
      redirect_to @user
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
