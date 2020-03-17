class UsersController < ApplicationController

  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user = User.create(user_params)
      session[:current_user_id] = @user.id
      flash[:notice] = "Sign Up successful!"
      redirect_to '/posts/yours'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
