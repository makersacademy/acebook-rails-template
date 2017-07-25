class UsersController < ApplicationController
  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render 'show'
    else
      @user = User.create
      render 'show'
    end
  end

end
