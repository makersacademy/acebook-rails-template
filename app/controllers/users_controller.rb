class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash[:warning] = "That email is already in use"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
