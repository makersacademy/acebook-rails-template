class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @userdbcheck = User.find_by(email: user_params[:email])
    if @userdbcheck == nil
      @user = User.new(user_params)
      @user.save
      redirect_to login_path
    else
      flash.now[:danger] = 'Email has already been taken'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
