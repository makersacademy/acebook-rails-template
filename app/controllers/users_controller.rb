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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :birthday, :hobbies, :relationship_status, :phone_number, :current_location, :home_town)
  end
end

  