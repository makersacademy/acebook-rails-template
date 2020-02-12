class UsersController < ApplicationController
  def new; end

  def create
    user_params = params.require(:users).permit(:email, :password)
    @user = User.new(user_params)
    @user.save
    session[:user] = @user
  end
end
