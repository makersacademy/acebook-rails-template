class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # The below line starts a rails console which you can use for debugging
    # debugger
  end

  def new
    @user = User.new
  end

  def create

  end

end
