class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to users_url
  end

  def index
    
  end

  
  private

  def user_params
    params.require(:user).permit(:email, :password, :handle, :full_name)
  end

end
