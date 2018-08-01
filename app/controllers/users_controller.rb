class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      # flash[:alert] = "The password needs to be between 6-10 characters"
      render :new
    end
  end

  def show
    @user = User.find(session[:current_user_id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
