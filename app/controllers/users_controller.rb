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
      render :new
      end
  end

  def show
    if logged_in?
      @user = User.find(session[:current_user_id])
    else
      redirect_to "/"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def logged_in?
    !session[:current_user_id].nil?
  end

end
