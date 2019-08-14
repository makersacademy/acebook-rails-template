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
    @user = User.create(user_params)
    if @user.save
      session[:current_user_id] = @user
      redirect_to user_post_url
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password)
  end
end
