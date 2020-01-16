class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.find_by_email(user_params[:email])
      redirect_to '/login', notice: "Already a user, please log in"
    elsif user_params[:password].length < 6 || user_params[:password].length > 10
      redirect_to '/signup', notice: "Password must be at least 6 characters and no more than 10"
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to '/posts', notice: "Signed up!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
