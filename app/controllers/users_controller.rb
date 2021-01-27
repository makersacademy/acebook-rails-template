class UsersController < ApplicationController
  def index
    check_for_user
    @users = User.all
  end

  def show
    check_for_user
    @user = User.find_by(id: session[:user_id])
  end

  def new
    session[:user_id] = nil
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
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
      if session[:user_id] === nil
        redirect_to new_user_url
      end
    end
end
