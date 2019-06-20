class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Acebook by D-Railed!"

      (redirect_to posts_path) && (return)
    else
      render :new
    end
  end

  private

  def signup_params
    params.require(:user).permit(:email, :password)
  end
end
