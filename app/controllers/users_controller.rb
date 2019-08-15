class UsersController < ApplicationController

  protect_from_forgery

  def show
    @user = User.find(params[:id])
    # The below line starts a rails console which you can use for debugging
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in(@user)
      session[:current_user_id] = @user.id
      p 'PRINTING HERE'
      p session[:current_user_id]
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end
