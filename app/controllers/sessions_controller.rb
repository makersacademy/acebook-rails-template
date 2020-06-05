class SessionsController < ApplicationController
  def new
    @user = User.last
  end

  def destroy
  end

  def create
    puts params
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      # flash[:alert] = 'Email and/or password is incorrect'
      redirect_to '/sessions/new', notice: 'Email and/or password is incorrect'
    end
  end
end
