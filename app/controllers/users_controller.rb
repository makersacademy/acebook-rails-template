class UsersController < ApplicationController

  def new
  end

  def create
    # @user = User.create()
    redirect_to '/session/new'
  end
end
