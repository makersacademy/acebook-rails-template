class SessionsController < ApplicationController
  def new
    @user = User.last
  end

  def destroy
  end

  def create
    puts params
    @user = User.find_by(email: params[:user][:email].downcase)
    # render "/users/#{@user.id}"
    redirect_to "/users/#{@user.id}"
  end
end
