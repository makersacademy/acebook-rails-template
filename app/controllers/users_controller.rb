class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      log_in @user 
      redirect_to '/'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end 

  def index
    @users = User.all.order(updated_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :birthday, :hobbies, :marital_status)
  end
end

  