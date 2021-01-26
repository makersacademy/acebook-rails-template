class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(name: "...", email: "...", password: "...")

    if @user.save 
      redirect_to # users homepage 
    else
      render :new
    end
  end
end
  
