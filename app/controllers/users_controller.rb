class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @messages = Message.all
    @message = Message.new
  end
end
