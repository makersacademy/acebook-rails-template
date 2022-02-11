class RegistrationsController < ApplicationController
  
  
def new
  @user = User.new
end
  
def index
      @users = User.all
  end
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :username)
  end
end