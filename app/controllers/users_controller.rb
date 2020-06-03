class UsersController < ApplicationController

  def new

  end

  def create
    # @user = User.create()
    redirect_to '/sessions/new'
  end
end
