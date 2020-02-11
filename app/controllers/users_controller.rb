class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    if params[:commit] == 'create'
      @user = User.create(params.require(:user).permit(:username, :password))
      session[:user_id] = @user.id
      redirect_to '/posts/index'
    elsif params[:commit] == 'login'
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
      else
        redirect_to '/'
      end
    end
    session[:user_id] = @user.id
    redirect_to '/posts/index'
  end
end
