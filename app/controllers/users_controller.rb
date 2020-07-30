class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]


  def new
    @user = User.new
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def create

    @user = User.create(user_params)
    # session[:user_id] = @user.id
    redirect_to '/welcome'

    # @user = User.new(user_params)
 
    # @user.save
    # redirect_to @user
    
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
