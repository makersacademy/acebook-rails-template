class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @wall = Wall.new(:user_id => @user.id, :id => @user.id)
      @wall.save
      @walls = Wall.all
      p @walls
      redirect_to '/'
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:username,:password)
  end
end
