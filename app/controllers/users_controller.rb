class UsersController < ApplicationController
  def show
    # @user = User.find(id: current_user.id)
    p current_user
    @user = current_user

  end
end
