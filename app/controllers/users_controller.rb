class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.type = params[:user][:type]
    # puts params[:user][:type]
    puts "HELLO"
    @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

end
